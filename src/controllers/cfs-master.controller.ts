import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {CfsMaster} from '../models';
import {CfsMasterRepository} from '../repositories';

export class CfsMasterController {
  constructor(
    @repository(CfsMasterRepository)
    public cfsMasterRepository : CfsMasterRepository,
  ) {}

  @post('/cfs-masters', {
    responses: {
      '200': {
        description: 'CfsMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(CfsMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsMaster, {
            title: 'NewCfsMaster',
            exclude: ['cfsMasterId'],
          }),
        },
      },
    })
    cfsMaster: Omit<CfsMaster, 'cfsMasterId'>,
  ): Promise<CfsMaster> {
    return this.cfsMasterRepository.create(cfsMaster);
  }

  @get('/cfs-masters/count', {
    responses: {
      '200': {
        description: 'CfsMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(CfsMaster) where?: Where<CfsMaster>,
  ): Promise<Count> {
    return this.cfsMasterRepository.count(where);
  }

  @get('/cfs-masters', {
    responses: {
      '200': {
        description: 'Array of CfsMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(CfsMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(CfsMaster) filter?: Filter<CfsMaster>,
  ): Promise<CfsMaster[]> {
    return this.cfsMasterRepository.find(filter);
  }

  @patch('/cfs-masters', {
    responses: {
      '200': {
        description: 'CfsMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsMaster, {partial: true}),
        },
      },
    })
    cfsMaster: CfsMaster,
    @param.where(CfsMaster) where?: Where<CfsMaster>,
  ): Promise<Count> {
    return this.cfsMasterRepository.updateAll(cfsMaster, where);
  }

  @get('/cfs-masters/{id}', {
    responses: {
      '200': {
        description: 'CfsMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CfsMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CfsMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<CfsMaster>
  ): Promise<CfsMaster> {
    return this.cfsMasterRepository.findById(id, filter);
  }

  @patch('/cfs-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsMaster, {partial: true}),
        },
      },
    })
    cfsMaster: CfsMaster,
  ): Promise<void> {
    await this.cfsMasterRepository.updateById(id, cfsMaster);
  }

  @put('/cfs-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() cfsMaster: CfsMaster,
  ): Promise<void> {
    await this.cfsMasterRepository.replaceById(id, cfsMaster);
  }

  @del('/cfs-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.cfsMasterRepository.deleteById(id);
  }
}
