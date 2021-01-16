import {authenticate} from '@loopback/authentication';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  HttpErrors,
  param,
  patch,
  post,
  put,
  requestBody
} from '@loopback/rest';
import {Bidusermapping} from '../models';
import {BidRepository, BidusermappingRepository} from '../repositories';
const mysql = require('mysql');
const db = require('mysql-promise')();
const mysqlCreds = require('../datasources/test.datasource.config.json');
@authenticate('jwt')
export class BidusermappingsController {
  constructor(
    @repository(BidusermappingRepository)
    public bidusermappingRepository: BidusermappingRepository,
    @repository(BidRepository)
    public bidRepository: BidRepository,
  ) {}

  @post('/bidusermappings', {
    responses: {
      '200': {
        description: 'Bidusermapping model instance',
        content: {
          'application/json': {schema: getModelSchemaRef(Bidusermapping)},
        },
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Bidusermapping, {
            title: 'NewBidusermapping',
            exclude: ['bidusermappingId'],
          }),
        },
      },
    })
    bidusermapping: Omit<Bidusermapping, 'bidusermappingId'>,
  ): Promise<Bidusermapping> {
    const bidval: number = bidusermapping.bidValue ?? 0;
    const callbid = await this.bidRepository.findOne({
      where: {
        bidId: bidusermapping.bidId,
      },
    });
    const lowerLimit = callbid?.bidLowerLimit ?? 0;
    const originalRate = callbid?.originalRate ?? 0;
    //console.log(lowerLimit);
    //console.log(bidval);
    if (bidval < lowerLimit) {
      throw new HttpErrors.UnprocessableEntity('Bid Value is too Low');
    }
    else if(bidval > originalRate){
      throw new HttpErrors.UnprocessableEntity('Bid Value is too High');
    }

    return this.bidusermappingRepository.create(bidusermapping);
  }

  @get('/bidusermappings/count', {
    responses: {
      '200': {
        description: 'Bidusermapping model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Bidusermapping) where?: Where<Bidusermapping>,
  ): Promise<Count> {
    return this.bidusermappingRepository.count(where);
  }

  @get('/bidusermappings', {
    responses: {
      '200': {
        description: 'Array of Bidusermapping model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Bidusermapping, {
                includeRelations: true,
              }),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Bidusermapping) filter?: Filter<Bidusermapping>,
  ): Promise<Bidusermapping[]> {
    return this.bidusermappingRepository.find(filter);
  }

  @patch('/bidusermappings', {
    responses: {
      '200': {
        description: 'Bidusermapping PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Bidusermapping, {partial: true}),
        },
      },
    })
    bidusermapping: Bidusermapping,
    @param.where(Bidusermapping) where?: Where<Bidusermapping>,
  ): Promise<Count> {
    const bidval: number = bidusermapping.bidValue ?? 0;
    const callbid = await this.bidRepository.findOne({
      where: {
        bidId: bidusermapping.bidId,
      },
    });
    const lowerLimit = callbid?.bidLowerLimit ?? 0;
    const originalRate = callbid?.originalRate ?? 0;
    //console.log(lowerLimit);
    //console.log(bidval);
    if (bidval < lowerLimit) {
      throw new HttpErrors.UnprocessableEntity('Bid Value is too Low');
    }
    else if(bidval > originalRate){
      throw new HttpErrors.UnprocessableEntity('Bid Value is too High');
    }
    return this.bidusermappingRepository.updateAll(bidusermapping, where);
  }

  @get('/bidusermappings/{id}', {
    responses: {
      '200': {
        description: 'Bidusermapping model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Bidusermapping, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Bidusermapping, {exclude: 'where'})
    filter?: FilterExcludingWhere<Bidusermapping>,
  ): Promise<Bidusermapping> {
    return this.bidusermappingRepository.findById(id, filter);
  }

  @patch('/bidusermappings/{id}', {
    responses: {
      '204': {
        description: 'Bidusermapping PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Bidusermapping, {partial: true}),
        },
      },
    })
    bidusermapping: Bidusermapping,
  ): Promise<void> {
    const bidval: number = bidusermapping.bidValue ?? 0;
    const callbid = await this.bidRepository.findOne({
      where: {
        bidId: bidusermapping.bidId,
      },
    });
    const lowerLimit = callbid?.bidLowerLimit ?? 0;
    const originalRate = callbid?.originalRate ?? 0;
    //console.log(lowerLimit);
    console.log(bidval);
    console.log(originalRate);
    if (bidval < lowerLimit) {
      throw new HttpErrors.UnprocessableEntity('Bid Value is too Low');
    }
    else if(bidval > originalRate){
      throw new HttpErrors.UnprocessableEntity('Bid Value is too High');
    }
    await this.bidusermappingRepository.updateById(id, bidusermapping);
  }

  @put('/bidusermappings/{id}', {
    responses: {
      '204': {
        description: 'Bidusermapping PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() bidusermapping: Bidusermapping,
  ): Promise<void> {
    const bidval: number = bidusermapping.bidValue ?? 0;
    const callbid = await this.bidRepository.findOne({
      where: {
        bidId: bidusermapping.bidId,
      },
    });
    const lowerLimit = callbid?.bidLowerLimit ?? 0;
    //console.log(lowerLimit);
    //console.log(bidval);
    if (bidval < lowerLimit) {
      throw new HttpErrors.UnprocessableEntity('Bid Value is too Low');
    }
    await this.bidusermappingRepository.replaceById(id, bidusermapping);
  }

  @del('/bidusermappings/{id}', {
    responses: {
      '204': {
        description: 'Bidusermapping DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.bidusermappingRepository.deleteById(id);
  }

  @get('/GetBidDetailsByBidId/{bidId}', {
    responses: {
      '200': {
        description: 'Search for Bidusermapping using Id',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Bidusermapping)},
          },
        },
      },
    },
  })
  async GetBidDetailsByBidId(
    @param.path.string('bidId') bidId: number,
  ): Promise<Bidusermapping> {
    const sqlStmt = mysql.format('CALL GetBidDetailsByBidId(?)', [bidId]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<Bidusermapping>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null)
        {
          connection.end();
          return reject(err);
        }
        resolve(results[0]);
        results = null;
        connection.end();
      });
    });
  }

  @get('/GetBidsbyUserId/{user_Id}', {
    responses: {
      '200': {
        description: 'Search for Bidusermapping using Id',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Bidusermapping)},
          },
        },
      },
    },
  })
  async GetBidsbyUserId(
    @param.path.string('user_Id') user_Id: number,
  ): Promise<Bidusermapping> {
    const sqlStmt = mysql.format('CALL GetBidsbyUserId(?)', [user_Id]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<Bidusermapping>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null)
        {
          connection.end();
          return reject(err);
        }
        resolve(results[0]);
        results = null;
        connection.end();
      });
    });
  }
}
