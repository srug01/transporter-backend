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
import {StatusDetails} from '../models';
import {StatusDetailsRepository} from '../repositories';
@authenticate('jwt')
export class StatusDetailsController {
  constructor(
    @repository(StatusDetailsRepository)
    public statusDetailsRepository : StatusDetailsRepository,
  ) {}

  @post('/status-details', {
    responses: {
      '200': {
        description: 'StatusDetails model instance',
        content: {'application/json': {schema: getModelSchemaRef(StatusDetails)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StatusDetails, {
            title: 'NewStatusDetails',
            exclude: ['statusDetailsId'],
          }),
        },
      },
    })
    statusDetails: Omit<StatusDetails, 'statusDetailsId'>,
  ): Promise<StatusDetails> {
    return this.statusDetailsRepository.create(statusDetails);
  }

  @get('/status-details/count', {
    responses: {
      '200': {
        description: 'StatusDetails model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(StatusDetails) where?: Where<StatusDetails>,
  ): Promise<Count> {
    return this.statusDetailsRepository.count(where);
  }

  @get('/status-details', {
    responses: {
      '200': {
        description: 'Array of StatusDetails model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(StatusDetails, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(StatusDetails) filter?: Filter<StatusDetails>,
  ): Promise<StatusDetails[]> {
    return this.statusDetailsRepository.find(filter);
  }

  @patch('/status-details', {
    responses: {
      '200': {
        description: 'StatusDetails PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StatusDetails, {partial: true}),
        },
      },
    })
    statusDetails: StatusDetails,
    @param.where(StatusDetails) where?: Where<StatusDetails>,
  ): Promise<Count> {
    return this.statusDetailsRepository.updateAll(statusDetails, where);
  }

  @get('/status-details/{id}', {
    responses: {
      '200': {
        description: 'StatusDetails model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(StatusDetails, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(StatusDetails, {exclude: 'where'}) filter?: FilterExcludingWhere<StatusDetails>
  ): Promise<StatusDetails> {
    return this.statusDetailsRepository.findById(id, filter);
  }

  @patch('/status-details/{id}', {
    responses: {
      '204': {
        description: 'StatusDetails PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(StatusDetails, {partial: true}),
        },
      },
    })
    statusDetails: StatusDetails,
  ): Promise<void> {
    await this.statusDetailsRepository.updateById(id, statusDetails);
  }

  @put('/status-details/{id}', {
    responses: {
      '204': {
        description: 'StatusDetails PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() statusDetails: StatusDetails,
  ): Promise<void> {
    await this.statusDetailsRepository.replaceById(id, statusDetails);
  }

  @del('/status-details/{id}', {
    responses: {
      '204': {
        description: 'StatusDetails DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.statusDetailsRepository.deleteById(id);
  }
}
