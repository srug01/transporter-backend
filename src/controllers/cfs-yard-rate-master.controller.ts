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
import {CfsYardRateMaster} from '../models';
import {CfsYardRateMasterRepository} from '../repositories';

export class CfsYardRateMasterController {
  constructor(
    @repository(CfsYardRateMasterRepository)
    public cfsYardRateMasterRepository : CfsYardRateMasterRepository,
  ) {}

  @post('/cfs-yard-rate-masters', {
    responses: {
      '200': {
        description: 'CfsYardRateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(CfsYardRateMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsYardRateMaster, {
            title: 'NewCfsYardRateMaster',
            exclude: ['cfsYardRateMasterId'],
          }),
        },
      },
    })
    cfsYardRateMaster: Omit<CfsYardRateMaster, 'cfsYardRateMasterId'>,
  ): Promise<CfsYardRateMaster> {
    return this.cfsYardRateMasterRepository.create(cfsYardRateMaster);
  }

  @get('/cfs-yard-rate-masters/count', {
    responses: {
      '200': {
        description: 'CfsYardRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(CfsYardRateMaster) where?: Where<CfsYardRateMaster>,
  ): Promise<Count> {
    return this.cfsYardRateMasterRepository.count(where);
  }

  @get('/cfs-yard-rate-masters', {
    responses: {
      '200': {
        description: 'Array of CfsYardRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(CfsYardRateMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(CfsYardRateMaster) filter?: Filter<CfsYardRateMaster>,
  ): Promise<CfsYardRateMaster[]> {
    return this.cfsYardRateMasterRepository.find(filter);
  }

  @patch('/cfs-yard-rate-masters', {
    responses: {
      '200': {
        description: 'CfsYardRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsYardRateMaster, {partial: true}),
        },
      },
    })
    cfsYardRateMaster: CfsYardRateMaster,
    @param.where(CfsYardRateMaster) where?: Where<CfsYardRateMaster>,
  ): Promise<Count> {
    return this.cfsYardRateMasterRepository.updateAll(cfsYardRateMaster, where);
  }

  @get('/cfs-yard-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'CfsYardRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CfsYardRateMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CfsYardRateMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<CfsYardRateMaster>
  ): Promise<CfsYardRateMaster> {
    return this.cfsYardRateMasterRepository.findById(id, filter);
  }

  @patch('/cfs-yard-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsYardRateMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsYardRateMaster, {partial: true}),
        },
      },
    })
    cfsYardRateMaster: CfsYardRateMaster,
  ): Promise<void> {
    await this.cfsYardRateMasterRepository.updateById(id, cfsYardRateMaster);
  }

  @put('/cfs-yard-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsYardRateMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() cfsYardRateMaster: CfsYardRateMaster,
  ): Promise<void> {
    await this.cfsYardRateMasterRepository.replaceById(id, cfsYardRateMaster);
  }

  @del('/cfs-yard-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsYardRateMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.cfsYardRateMasterRepository.deleteById(id);
  }
}
