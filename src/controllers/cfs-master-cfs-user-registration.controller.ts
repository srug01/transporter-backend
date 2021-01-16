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
  CfsMaster,
  CfsUserRegistration
} from '../models';
import {CfsMasterRepository} from '../repositories';
@authenticate('jwt')
export class CfsMasterCfsUserRegistrationController {
  constructor(
    @repository(CfsMasterRepository) protected cfsMasterRepository: CfsMasterRepository,
  ) { }

  @get('/cfs-masters/{id}/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'Array of CfsMaster has many CfsUserRegistration',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(CfsUserRegistration)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<CfsUserRegistration>,
  ): Promise<CfsUserRegistration[]> {
    return this.cfsMasterRepository.cfsUserRegistrations(id).find(filter);
  }

  @post('/cfs-masters/{id}/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'CfsMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(CfsUserRegistration)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof CfsMaster.prototype.cfsMasterId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {
            title: 'NewCfsUserRegistrationInCfsMaster',
            exclude: ['cfsUserRegistrationId'],
            optional: ['cfsMasterId']
          }),
        },
      },
    }) cfsUserRegistration: Omit<CfsUserRegistration, 'cfsUserRegistrationId'>,
  ): Promise<CfsUserRegistration> {
    return this.cfsMasterRepository.cfsUserRegistrations(id).create(cfsUserRegistration);
  }

  @patch('/cfs-masters/{id}/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'CfsMaster.CfsUserRegistration PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {partial: true}),
        },
      },
    })
    cfsUserRegistration: Partial<CfsUserRegistration>,
    @param.query.object('where', getWhereSchemaFor(CfsUserRegistration)) where?: Where<CfsUserRegistration>,
  ): Promise<Count> {
    return this.cfsMasterRepository.cfsUserRegistrations(id).patch(cfsUserRegistration, where);
  }

  @del('/cfs-masters/{id}/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'CfsMaster.CfsUserRegistration DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(CfsUserRegistration)) where?: Where<CfsUserRegistration>,
  ): Promise<Count> {
    return this.cfsMasterRepository.cfsUserRegistrations(id).delete(where);
  }
}
