import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {
  CfsUserRegistration,
  Payments,
} from '../models';
import {CfsUserRegistrationRepository} from '../repositories';

export class CfsUserRegistrationPaymentsController {
  constructor(
    @repository(CfsUserRegistrationRepository) protected cfsUserRegistrationRepository: CfsUserRegistrationRepository,
  ) { }

  @get('/cfs-user-registrations/{id}/payments', {
    responses: {
      '200': {
        description: 'Array of CfsUserRegistration has many Payments',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Payments)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Payments>,
  ): Promise<Payments[]> {
    return this.cfsUserRegistrationRepository.payments(id).find(filter);
  }

  @post('/cfs-user-registrations/{id}/payments', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model instance',
        content: {'application/json': {schema: getModelSchemaRef(Payments)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof CfsUserRegistration.prototype.cfsUserRegistrationId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Payments, {
            title: 'NewPaymentsInCfsUserRegistration',
            exclude: ['paymentId'],
            optional: ['userId']
          }),
        },
      },
    }) payments: Omit<Payments, 'paymentId'>,
  ): Promise<Payments> {
    return this.cfsUserRegistrationRepository.payments(id).create(payments);
  }

  @patch('/cfs-user-registrations/{id}/payments', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Payments PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Payments, {partial: true}),
        },
      },
    })
    payments: Partial<Payments>,
    @param.query.object('where', getWhereSchemaFor(Payments)) where?: Where<Payments>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.payments(id).patch(payments, where);
  }

  @del('/cfs-user-registrations/{id}/payments', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Payments DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Payments)) where?: Where<Payments>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.payments(id).delete(where);
  }
}
