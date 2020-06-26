import {inject} from '@loopback/core';
import {
  del,
  get,
  param,
  post,
  Request,
  requestBody,
  Response,
  RestBindings,
} from '@loopback/rest';
import AWS from 'aws-sdk';
import HttpErrors from 'http-errors';
import multer from 'multer';
import stream from 'stream';

const {Duplex} = stream;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function bufferToStream(buffer: any) {
  const duplexStream = new Duplex();
  duplexStream.push(buffer);
  duplexStream.push(null);
  return duplexStream;
}

const config = {
  region: 'Asia Pacific (Mumbai)',
  accessKeyId: 'AKIAIBKD3BP2KXX2S6VA',
  secretAccessKey: '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',
  //endpoint: process.env.S3_ENDPOINT,
};
const s3 = new AWS.S3(config);
export class StorageController {
  constructor() {}

  @get('/buckets', {
    responses: {
      '200': {
        description: 'List of buckets',
        content: {
          'application/json': {
            schema: {
              type: 'object',
              properties: {
                Name: {type: 'string'},
                CreationDate: {type: 'string'},
              },
            },
          },
        },
      },
    },
  })
  async list(): Promise<object> {
    // eslint-disable-next-line no-useless-catch
    try {
      const buckets = await s3.listBuckets().promise();
      return buckets;
    } catch (error) {
      throw error;
    }
  }

  @post('/buckets', {
    responses: {
      '200': {
        description: 'Bucket creation response',
        content: {
          'application/json': {
            schema: {
              type: 'object',
              properties: {
                Location: {type: 'string'},
                headers: {
                  type: 'object',
                  properties: {
                    'Content-Type': {type: 'string'},
                  },
                },
              },
            },
          },
        },
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              Name: {type: 'string'},
            },
          },
        },
      },
    })
    bucket: {
      Name: string;
    },
  ): Promise<object> {
    if (bucket.Name === undefined) {
      const err = new HttpErrors.BadRequest('Name not found');
      throw err;
    }
    const params = {
      Bucket: bucket.Name,
    };
    // eslint-disable-next-line no-useless-catch
    try {
      const bucket = await s3.createBucket(params).promise();
      return bucket;
    } catch (error) {
      throw error;
    }
  }

  @del('/buckets/{bucketName}', {
    responses: {
      '204': {
        description: 'Bucket DELETE success',
      },
    },
  })
  async deleteById(
    @param.path.string('bucketName') bucket: string,
  ): Promise<void> {
    const params = {
      Bucket: bucket,
    };
    // eslint-disable-next-line no-useless-catch
    try {
      await s3.deleteBucket(params).promise();
      return;
    } catch (error) {
      throw error;
    }
  }

  @post('/buckets/{bucketName}/upload', {
    responses: {
      200: {
        content: {
          'application/json': {
            schema: {
              type: 'object',
            },
          },
        },
        description: '',
      },
    },
  })
  async upload(
    @param.path.string('bucketName') bucketName: string,
    @requestBody({
      description: 'multipart/form-data value.',
      required: true,
      content: {
        'multipart/form-data': {
          // Skip body parsing
          'x-parser': 'stream',
          schema: {type: 'object'},
        },
      },
    })
    request: Request,
    @inject(RestBindings.Http.RESPONSE) response: Response,
  ): Promise<object> {
    return new Promise<object>((resolve, reject) => {
      const storage = multer.memoryStorage();
      const upload = multer({storage});
      upload.any()(request, response, async err => {
        if (err) reject(err);
        else {
          const res = [];
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          for (const file of (request as any).files) {
            const params = {
              Bucket: bucketName,
              Key: file.originalname, // File name you want to save as in S3
              Body: bufferToStream(file.buffer),
            };
            try {
              const stored = await s3.upload(params).promise();
              res.push(stored);
            } catch (error) {
              reject(err);
            }
          }
          resolve(res);
        }
      });
    });
  }
}
