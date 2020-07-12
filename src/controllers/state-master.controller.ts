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
import {StateMaster} from '../models';
import {StateMasterRepository} from '../repositories';

export class StateMasterController {
  constructor(
    @repository(StateMasterRepository)
    public stateMasterRepository : StateMasterRepository,
  ) {}

  @post('/state-masters', {
    responses: {
      '200': {
        description: 'StateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(StateMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StateMaster, {
            title: 'NewStateMaster',
            exclude: ['stateMasterId'],
          }),
        },
      },
    })
    stateMaster: Omit<StateMaster, 'stateMasterId'>,
  ): Promise<StateMaster> {
    return this.stateMasterRepository.create(stateMaster);
  }

  @get('/state-masters/count', {
    responses: {
      '200': {
        description: 'StateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(StateMaster) where?: Where<StateMaster>,
  ): Promise<Count> {
    return this.stateMasterRepository.count(where);
  }

  @get('/state-masters', {
    responses: {
      '200': {
        description: 'Array of StateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(StateMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(StateMaster) filter?: Filter<StateMaster>,
  ): Promise<StateMaster[]> {
    return this.stateMasterRepository.find(filter);
  }

  @patch('/state-masters', {
    responses: {
      '200': {
        description: 'StateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StateMaster, {partial: true}),
        },
      },
    })
    stateMaster: StateMaster,
    @param.where(StateMaster) where?: Where<StateMaster>,
  ): Promise<Count> {
    return this.stateMasterRepository.updateAll(stateMaster, where);
  }

  @get('/state-masters/{id}', {
    responses: {
      '200': {
        description: 'StateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(StateMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(StateMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<StateMaster>
  ): Promise<StateMaster> {
    return this.stateMasterRepository.findById(id, filter);
  }

  @patch('/state-masters/{id}', {
    responses: {
      '204': {
        description: 'StateMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StateMaster, {partial: true}),
        },
      },
    })
    stateMaster: StateMaster,
  ): Promise<void> {
    await this.stateMasterRepository.updateById(id, stateMaster);
  }

  @put('/state-masters/{id}', {
    responses: {
      '204': {
        description: 'StateMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() stateMaster: StateMaster,
  ): Promise<void> {
    await this.stateMasterRepository.replaceById(id, stateMaster);
  }

  @del('/state-masters/{id}', {
    responses: {
      '204': {
        description: 'StateMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.stateMasterRepository.deleteById(id);
  }
}
