/* eslint-disable no-shadow */
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
import {CfsPortRateMaster} from '../models';
import {CfsPortRateMasterRepository} from '../repositories';
@authenticate('jwt')
export class CfsPortRateMasterController {
  constructor(
    @repository(CfsPortRateMasterRepository)
    public CfsPortRateMasterRepository: CfsPortRateMasterRepository,
  ) {}

  @post('/cfs-port-rate-masters', {
    responses: {
      '200': {
        description: 'CfsPortRateMaster model instance',
        content: {
          'application/json': {schema: getModelSchemaRef(CfsPortRateMaster)},
        },
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsPortRateMaster, {
            title: 'NewCfsPortRateMaster',
            exclude: ['cfsPortRateMasterId'],
          }),
        },
      },
    })
    CfsPortRateMaster: Omit<CfsPortRateMaster, 'cfsPortRateMasterId'>,
  ): Promise<CfsPortRateMaster> {
    const existing = await this.CfsPortRateMasterRepository.find({
      where: {
        and: [
          {cfsMasterId: CfsPortRateMaster.cfsMasterId},
          {portMasterId: CfsPortRateMaster.portMasterId},
          {containerMasterId: CfsPortRateMaster.containerMasterId},
          {weightMasterId: CfsPortRateMaster.weightMasterId},
          {isActive: true},
        ],
      },
    });
    if (existing.length > 0) {
      throw new HttpErrors.UnprocessableEntity(
        'Data already Exists for this combination',
      );
    }
    return this.CfsPortRateMasterRepository.create(CfsPortRateMaster);
  }

  @get('/cfs-port-rate-masters/count', {
    responses: {
      '200': {
        description: 'CfsPortRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(CfsPortRateMaster) where?: Where<CfsPortRateMaster>,
  ): Promise<Count> {
    return this.CfsPortRateMasterRepository.count(where);
  }

  @get('/cfs-port-rate-masters', {
    responses: {
      '200': {
        description: 'Array of CfsPortRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(CfsPortRateMaster, {
                includeRelations: true,
              }),
            },
          },
        },
      },
    },
  })
  async find(
    // @param.filter(CfsPortRateMaster) filter?: Filter<CfsPortRateMaster>,
    @param.filter(CfsPortRateMaster) filter: Filter<CfsPortRateMaster> = {where : {isActive: true}},
  ): Promise<CfsPortRateMaster[]> {
    return this.CfsPortRateMasterRepository.find(filter);
  }

  @patch('/cfs-port-rate-masters', {
    responses: {
      '200': {
        description: 'CfsPortRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsPortRateMaster, {partial: true}),
        },
      },
    })
    CfsPortRateMaster: CfsPortRateMaster,
    @param.where(CfsPortRateMaster) where?: Where<CfsPortRateMaster>,
  ): Promise<Count> {
    return this.CfsPortRateMasterRepository.updateAll(CfsPortRateMaster, where);
  }

  @get('/cfs-port-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'CfsPortRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CfsPortRateMaster, {
              includeRelations: true,
            }),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CfsPortRateMaster, {exclude: 'where'})
    filter?: FilterExcludingWhere<CfsPortRateMaster>,
  ): Promise<CfsPortRateMaster> {
    return this.CfsPortRateMasterRepository.findById(id, filter);
  }

  @patch('/cfs-port-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsPortRateMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsPortRateMaster, {partial: true}),
        },
      },
    })
    CfsPortRateMaster: CfsPortRateMaster,
  ): Promise<void> {
    await this.CfsPortRateMasterRepository.updateById(id, CfsPortRateMaster);
  }

  @put('/cfs-port-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsPortRateMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() CfsPortRateMaster: CfsPortRateMaster,
  ): Promise<void> {
    await this.CfsPortRateMasterRepository.replaceById(id, CfsPortRateMaster);
  }

  @del('/cfs-port-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsPortRateMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.CfsPortRateMasterRepository.deleteById(id);
  }
}
