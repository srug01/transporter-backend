import {authenticate} from '@loopback/authentication';
import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {
  PortMaster, StateMaster
} from '../models';
import {StateMasterRepository} from '../repositories';
@authenticate('jwt')
export class StateMasterPortMasterController {
  constructor(
    @repository(StateMasterRepository) protected stateMasterRepository: StateMasterRepository,
  ) { }

  @get('/state-masters/{id}/port-masters', {
    responses: {
      '200': {
        description: 'Array of StateMaster has many PortMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(PortMaster)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<PortMaster>,
  ): Promise<PortMaster[]> {
    return this.stateMasterRepository.portMasters(id).find(filter);
  }

  @post('/state-masters/{id}/port-masters', {
    responses: {
      '200': {
        description: 'StateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(PortMaster)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof StateMaster.prototype.stateMasterId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortMaster, {
            title: 'NewPortMasterInStateMaster',
            exclude: ['portMasterId'],
            optional: ['stateMasterId']
          }),
        },
      },
    }) portMaster: Omit<PortMaster, 'portMasterId'>,
  ): Promise<PortMaster> {
    return this.stateMasterRepository.portMasters(id).create(portMaster);
  }

  @patch('/state-masters/{id}/port-masters', {
    responses: {
      '200': {
        description: 'StateMaster.PortMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortMaster, {partial: true}),
        },
      },
    })
    portMaster: Partial<PortMaster>,
    @param.query.object('where', getWhereSchemaFor(PortMaster)) where?: Where<PortMaster>,
  ): Promise<Count> {
    return this.stateMasterRepository.portMasters(id).patch(portMaster, where);
  }

  @del('/state-masters/{id}/port-masters', {
    responses: {
      '200': {
        description: 'StateMaster.PortMaster DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PortMaster)) where?: Where<PortMaster>,
  ): Promise<Count> {
    return this.stateMasterRepository.portMasters(id).delete(where);
  }
}
