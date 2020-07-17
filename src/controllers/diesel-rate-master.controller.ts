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
import {DieselRateMaster} from '../models';
import {DieselRateMasterRepository} from '../repositories';

export class DieselRateMasterController {
  constructor(
    @repository(DieselRateMasterRepository)
    public dieselRateMasterRepository : DieselRateMasterRepository,
  ) {}

  @post('/diesel-rate-masters', {
    responses: {
      '200': {
        description: 'DieselRateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(DieselRateMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DieselRateMaster, {
            title: 'NewDieselRateMaster',
            exclude: ['dieselRateId'],
          }),
        },
      },
    })
    dieselRateMaster: Omit<DieselRateMaster, 'dieselRateId'>,
  ): Promise<DieselRateMaster> {
    return this.dieselRateMasterRepository.create(dieselRateMaster);
  }

  @get('/diesel-rate-masters/count', {
    responses: {
      '200': {
        description: 'DieselRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(DieselRateMaster) where?: Where<DieselRateMaster>,
  ): Promise<Count> {
    return this.dieselRateMasterRepository.count(where);
  }

  @get('/diesel-rate-masters', {
    responses: {
      '200': {
        description: 'Array of DieselRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(DieselRateMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(DieselRateMaster) filter?: Filter<DieselRateMaster>,
  ): Promise<DieselRateMaster[]> {
    return this.dieselRateMasterRepository.find(filter);
  }

  @patch('/diesel-rate-masters', {
    responses: {
      '200': {
        description: 'DieselRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DieselRateMaster, {partial: true}),
        },
      },
    })
    dieselRateMaster: DieselRateMaster,
    @param.where(DieselRateMaster) where?: Where<DieselRateMaster>,
  ): Promise<Count> {
    return this.dieselRateMasterRepository.updateAll(dieselRateMaster, where);
  }

  @get('/diesel-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'DieselRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(DieselRateMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(DieselRateMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<DieselRateMaster>
  ): Promise<DieselRateMaster> {
    return this.dieselRateMasterRepository.findById(id, filter);
  }

  @patch('/diesel-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'DieselRateMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DieselRateMaster, {partial: true}),
        },
      },
    })
    dieselRateMaster: DieselRateMaster,
  ): Promise<void> {
    await this.dieselRateMasterRepository.updateById(id, dieselRateMaster);
  }

  @put('/diesel-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'DieselRateMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() dieselRateMaster: DieselRateMaster,
  ): Promise<void> {
    await this.dieselRateMasterRepository.replaceById(id, dieselRateMaster);
  }

  @del('/diesel-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'DieselRateMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.dieselRateMasterRepository.deleteById(id);
  }
}
