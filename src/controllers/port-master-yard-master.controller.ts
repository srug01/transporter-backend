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
  PortMaster,
  YardMaster
} from '../models';
import {PortMasterRepository} from '../repositories';
@authenticate('jwt')
export class PortMasterYardMasterController {
  constructor(
    @repository(PortMasterRepository) protected portMasterRepository: PortMasterRepository,
  ) { }

  @get('/port-masters/{id}/yard-masters', {
    responses: {
      '200': {
        description: 'Array of PortMaster has many YardMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(YardMaster)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<YardMaster>,
  ): Promise<YardMaster[]> {
    return this.portMasterRepository.yardMasters(id).find(filter);
  }

  @post('/port-masters/{id}/yard-masters', {
    responses: {
      '200': {
        description: 'PortMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(YardMaster)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof PortMaster.prototype.portMasterId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardMaster, {
            title: 'NewYardMasterInPortMaster',
            exclude: ['yardMasterId'],
            optional: ['portMasterId']
          }),
        },
      },
    }) yardMaster: Omit<YardMaster, 'yardMasterId'>,
  ): Promise<YardMaster> {
    return this.portMasterRepository.yardMasters(id).create(yardMaster);
  }

  @patch('/port-masters/{id}/yard-masters', {
    responses: {
      '200': {
        description: 'PortMaster.YardMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardMaster, {partial: true}),
        },
      },
    })
    yardMaster: Partial<YardMaster>,
    @param.query.object('where', getWhereSchemaFor(YardMaster)) where?: Where<YardMaster>,
  ): Promise<Count> {
    return this.portMasterRepository.yardMasters(id).patch(yardMaster, where);
  }

  @del('/port-masters/{id}/yard-masters', {
    responses: {
      '200': {
        description: 'PortMaster.YardMaster DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(YardMaster)) where?: Where<YardMaster>,
  ): Promise<Count> {
    return this.portMasterRepository.yardMasters(id).delete(where);
  }
}
