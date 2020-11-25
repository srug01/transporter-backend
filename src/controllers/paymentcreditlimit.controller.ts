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
import {PaymentCreditLimit} from '../models';
import {PaymentCreditLimitRepository} from '../repositories';

export class PaymentsController {
  constructor(
    @repository(PaymentCreditLimitRepository)
    public paymentcreditlimitRepository : PaymentCreditLimitRepository,
  ) {}

  @post('/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'PaymentCreditLimit model instance',
        content: {'application/json': {schema: getModelSchemaRef(PaymentCreditLimit)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentCreditLimit, {
            title: 'NewPaymentCreditLimit',
            exclude: ['paymentId'],
          }),
        },
      },
    })
    paymentcreditlimit: Omit<PaymentCreditLimit, 'paymentId'>,
  ): Promise<PaymentCreditLimit> {
    return this.paymentcreditlimitRepository.create(paymentcreditlimit);
  }

  @get('/paymentcreditlimit/count', {
    responses: {
      '200': {
        description: 'Payments model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PaymentCreditLimit) where?: Where<PaymentCreditLimit>,
  ): Promise<Count> {
    return this.paymentcreditlimitRepository.count(where);
  }

  @get('/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'Array of PaymentCreditLimit model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PaymentCreditLimit, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PaymentCreditLimit) filter?: Filter<PaymentCreditLimit>,
  ): Promise<PaymentCreditLimit[]> {
    return this.paymentcreditlimitRepository.find(filter);
  }

  @patch('/paymentcreditlimit', {
    responses: {
      '200': {
        description: 'PaymentCreditLimit PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentCreditLimit, {partial: true}),
        },
      },
    })
    paymentcreditlimit: PaymentCreditLimit,
    @param.where(PaymentCreditLimit) where?: Where<PaymentCreditLimit>,
  ): Promise<Count> {
    return this.paymentcreditlimitRepository.updateAll(paymentcreditlimit, where);
  }

  @get('/paymentcreditlimit/{id}', {
    responses: {
      '200': {
        description: 'PaymentCreditLimit model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PaymentCreditLimit, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PaymentCreditLimit, {exclude: 'where'}) filter?: FilterExcludingWhere<PaymentCreditLimit>
  ): Promise<PaymentCreditLimit> {
    return this.paymentcreditlimitRepository.findById(id, filter);
  }

  @patch('/paymentcreditlimit/{id}', {
    responses: {
      '204': {
        description: 'PaymentCreditLimit PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentCreditLimit, {partial: true}),
        },
      },
    })
    paymentcreditlimit: PaymentCreditLimit,
  ): Promise<void> {
    await this.paymentcreditlimitRepository.updateById(id, paymentcreditlimit);
  }

  @put('/paymentcreditlimit/{id}', {
    responses: {
      '204': {
        description: 'PaymentCreditLimit PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() paymentcreditlimit: PaymentCreditLimit,
  ): Promise<void> {
    await this.paymentcreditlimitRepository.replaceById(id, paymentcreditlimit);
  }

  @del('/paymentcreditlimit/{id}', {
    responses: {
      '204': {
        description: 'PaymentCreditLimit DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.paymentcreditlimitRepository.deleteById(id);
  }
}
