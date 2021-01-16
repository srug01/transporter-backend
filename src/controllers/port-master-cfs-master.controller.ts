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
  CfsMaster, PortMaster
} from '../models';
import {PortMasterRepository} from '../repositories';
@authenticate('jwt')
export class PortMasterCfsMasterController {
  constructor(
    @repository(PortMasterRepository) protected portMasterRepository: PortMasterRepository,
  ) { }

  @get('/port-masters/{id}/cfs-masters', {
    responses: {
      '200': {
        description: 'Array of PortMaster has many CfsMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(CfsMaster)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<CfsMaster>,
  ): Promise<CfsMaster[]> {
    return this.portMasterRepository.cfsMasters(id).find(filter);
  }

  @post('/port-masters/{id}/cfs-masters', {
    responses: {
      '200': {
        description: 'PortMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(CfsMaster)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof PortMaster.prototype.portMasterId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsMaster, {
            title: 'NewCfsMasterInPortMaster',
            exclude: ['cfsMasterId'],
            optional: ['portMasterId']
          }),
        },
      },
    }) cfsMaster: Omit<CfsMaster, 'cfsMasterId'>,
  ): Promise<CfsMaster> {
    return this.portMasterRepository.cfsMasters(id).create(cfsMaster);
  }

  @patch('/port-masters/{id}/cfs-masters', {
    responses: {
      '200': {
        description: 'PortMaster.CfsMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsMaster, {partial: true}),
        },
      },
    })
    cfsMaster: Partial<CfsMaster>,
    @param.query.object('where', getWhereSchemaFor(CfsMaster)) where?: Where<CfsMaster>,
  ): Promise<Count> {
    return this.portMasterRepository.cfsMasters(id).patch(cfsMaster, where);
  }

  @del('/port-masters/{id}/cfs-masters', {
    responses: {
      '200': {
        description: 'PortMaster.CfsMaster DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(CfsMaster)) where?: Where<CfsMaster>,
  ): Promise<Count> {
    return this.portMasterRepository.cfsMasters(id).delete(where);
  }
}
