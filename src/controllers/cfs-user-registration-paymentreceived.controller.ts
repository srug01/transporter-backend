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
  CfsUserRegistration,
  Paymentreceived
} from '../models';
import {CfsUserRegistrationRepository} from '../repositories';
@authenticate('jwt')
export class CfsUserRegistrationPaymentreceivedController {
  constructor(
    @repository(CfsUserRegistrationRepository) protected cfsUserRegistrationRepository: CfsUserRegistrationRepository,
  ) { }

  @get('/cfs-user-registrations/{id}/paymentreceiveds', {
    responses: {
      '200': {
        description: 'Array of CfsUserRegistration has many Paymentreceived',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Paymentreceived)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Paymentreceived>,
  ): Promise<Paymentreceived[]> {
    return this.cfsUserRegistrationRepository.paymentsReceived(id).find(filter);
  }

  @post('/cfs-user-registrations/{id}/paymentreceiveds', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model instance',
        content: {'application/json': {schema: getModelSchemaRef(Paymentreceived)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof CfsUserRegistration.prototype.cfsUserRegistrationId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymentreceived, {
            title: 'NewPaymentreceivedInCfsUserRegistration',
            exclude: ['paymentreceivedId'],
            optional: ['userId']
          }),
        },
      },
    }) paymentreceived: Omit<Paymentreceived, 'paymentreceivedId'>,
  ): Promise<Paymentreceived> {
    return this.cfsUserRegistrationRepository.paymentsReceived(id).create(paymentreceived);
  }

  @patch('/cfs-user-registrations/{id}/paymentreceiveds', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Paymentreceived PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymentreceived, {partial: true}),
        },
      },
    })
    paymentreceived: Partial<Paymentreceived>,
    @param.query.object('where', getWhereSchemaFor(Paymentreceived)) where?: Where<Paymentreceived>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.paymentsReceived(id).patch(paymentreceived, where);
  }

  @del('/cfs-user-registrations/{id}/paymentreceiveds', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Paymentreceived DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Paymentreceived)) where?: Where<Paymentreceived>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.paymentsReceived(id).delete(where);
  }
}
