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
  PaymentCreditLimit,
  Paymenthistory
} from '../models';
import {CfsUserRegistrationRepository} from '../repositories';

export class CfsUserRegistrationPaymentCreditLimitController {
  constructor(
    @repository(CfsUserRegistrationRepository) protected cfsUserRegistrationRepository: CfsUserRegistrationRepository,
  ) { }

  @get('/cfs-user-registrations/{id}/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'Array of CfsUserRegistration has many PaymentCreditLimit',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(PaymentCreditLimit)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<PaymentCreditLimit>,
  ): Promise<PaymentCreditLimit[]> {
    return this.cfsUserRegistrationRepository.paymentcreditlimit(id).find(filter);
  }

  @post('/cfs-user-registrations/{id}/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model instance',
        content: {'application/json': {schema: getModelSchemaRef(PaymentCreditLimit)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof CfsUserRegistration.prototype.cfsUserRegistrationId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentCreditLimit, {
            title: 'NewPaymentCreditLimitInCfsUserRegistration',
            exclude: ['paymentId'],
            optional: ['userId']
          }),
        },
      },
    }) paymentcreditlimit: Omit<PaymentCreditLimit, 'paymentId'>,
  ): Promise<PaymentCreditLimit> {
    const paymentHistory = {
      userId: paymentcreditlimit.userId,
      creditLimit: paymentcreditlimit.creditLimit,
      AvailableLimit: paymentcreditlimit.creditLimit,
      Outstanding: 0,
      createdBy: paymentcreditlimit.createdBy,
      createdOn: paymentcreditlimit.createdOn
    } as Paymenthistory;
    // const paymenthistory = await this.cfsUserRegistrationRepository.paymenthistories(id).create(paymentHistory);
    return this.cfsUserRegistrationRepository.paymentcreditlimit(id).create(paymentcreditlimit);
  }

  @patch('/cfs-user-registrations/{id}/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.PaymentCreditLimit PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentCreditLimit, {partial: true}),
        },
      },
    })
    paymentcreditlimit: Partial<PaymentCreditLimit>,
    @param.query.object('where', getWhereSchemaFor(PaymentCreditLimit)) where?: Where<PaymentCreditLimit>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.paymentcreditlimit(id).patch(paymentcreditlimit, where);
  }

  @del('/cfs-user-registrations/{id}/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Payments DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(PaymentCreditLimit)) where?: Where<PaymentCreditLimit>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.paymentcreditlimit(id).delete(where);
  }
}
