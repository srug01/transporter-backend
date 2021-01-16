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
  del, get,
  getModelSchemaRef, param,


  patch, post,




  put,

  requestBody
} from '@loopback/rest';
import {StatusMaster} from '../models';
import {StatusMasterRepository} from '../repositories';
@authenticate('jwt')
export class StatusMasterController {
  constructor(
    @repository(StatusMasterRepository)
    public statusMasterRepository : StatusMasterRepository,
  ) {}

  @post('/status-masters', {
    responses: {
      '200': {
        description: 'StatusMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(StatusMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StatusMaster, {
            title: 'NewStatusMaster',
            exclude: ['statusMasterId'],
          }),
        },
      },
    })
    statusMaster: Omit<StatusMaster, 'statusMasterId'>,
  ): Promise<StatusMaster> {
    return this.statusMasterRepository.create(statusMaster);
  }

  @get('/status-masters/count', {
    responses: {
      '200': {
        description: 'StatusMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(StatusMaster) where?: Where<StatusMaster>,
  ): Promise<Count> {
    return this.statusMasterRepository.count(where);
  }

  @get('/status-masters', {
    responses: {
      '200': {
        description: 'Array of StatusMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(StatusMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(StatusMaster) filter?: Filter<StatusMaster>,
  ): Promise<StatusMaster[]> {
    return this.statusMasterRepository.find(filter);
  }

  @patch('/status-masters', {
    responses: {
      '200': {
        description: 'StatusMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StatusMaster, {partial: true}),
        },
      },
    })
    statusMaster: StatusMaster,
    @param.where(StatusMaster) where?: Where<StatusMaster>,
  ): Promise<Count> {
    return this.statusMasterRepository.updateAll(statusMaster, where);
  }

  @get('/status-masters/{id}', {
    responses: {
      '200': {
        description: 'StatusMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(StatusMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(StatusMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<StatusMaster>
  ): Promise<StatusMaster> {
    return this.statusMasterRepository.findById(id, filter);
  }

  @patch('/status-masters/{id}', {
    responses: {
      '204': {
        description: 'StatusMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StatusMaster, {partial: true}),
        },
      },
    })
    statusMaster: StatusMaster,
  ): Promise<void> {
    await this.statusMasterRepository.updateById(id, statusMaster);
  }

  @put('/status-masters/{id}', {
    responses: {
      '204': {
        description: 'StatusMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() statusMaster: StatusMaster,
  ): Promise<void> {
    await this.statusMasterRepository.replaceById(id, statusMaster);
  }

  @del('/status-masters/{id}', {
    responses: {
      '204': {
        description: 'StatusMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.statusMasterRepository.deleteById(id);
  }
}
