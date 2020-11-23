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
  Paymenthistory,
} from '../models';
import {CfsUserRegistrationRepository} from '../repositories';

export class CfsUserRegistrationPaymenthistoryController {
  constructor(
    @repository(CfsUserRegistrationRepository) protected cfsUserRegistrationRepository: CfsUserRegistrationRepository,
  ) { }

  @get('/cfs-user-registrations/{id}/paymenthistories', {
    responses: {
      '200': {
        description: 'Array of CfsUserRegistration has many Paymenthistory',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Paymenthistory)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Paymenthistory>,
  ): Promise<Paymenthistory[]> {
    return this.cfsUserRegistrationRepository.paymenthistories(id).find(filter);
  }

  @post('/cfs-user-registrations/{id}/paymenthistories', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model instance',
        content: {'application/json': {schema: getModelSchemaRef(Paymenthistory)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof CfsUserRegistration.prototype.cfsUserRegistrationId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymenthistory, {
            title: 'NewPaymenthistoryInCfsUserRegistration',
            exclude: ['paymenthistoryId'],
            optional: ['userId']
          }),
        },
      },
    }) paymenthistory: Omit<Paymenthistory, 'paymenthistoryId'>,
  ): Promise<Paymenthistory> {
    return this.cfsUserRegistrationRepository.paymenthistories(id).create(paymenthistory);
  }

  @patch('/cfs-user-registrations/{id}/paymenthistories', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Paymenthistory PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymenthistory, {partial: true}),
        },
      },
    })
    paymenthistory: Partial<Paymenthistory>,
    @param.query.object('where', getWhereSchemaFor(Paymenthistory)) where?: Where<Paymenthistory>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.paymenthistories(id).patch(paymenthistory, where);
  }

  @del('/cfs-user-registrations/{id}/paymenthistories', {
    responses: {
      '200': {
        description: 'CfsUserRegistration.Paymenthistory DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Paymenthistory)) where?: Where<Paymenthistory>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.paymenthistories(id).delete(where);
  }
}
