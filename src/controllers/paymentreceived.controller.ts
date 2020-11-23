import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {Paymentreceived} from '../models';
import {PaymentreceivedRepository} from '../repositories';

export class PaymentreceivedController {
  constructor(
    @repository(PaymentreceivedRepository)
    public paymentreceivedRepository : PaymentreceivedRepository,
  ) {}

  @post('/paymentsreceived', {
    responses: {
      '200': {
        description: 'Paymentreceived model instance',
        content: {'application/json': {schema: getModelSchemaRef(Paymentreceived)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymentreceived, {
            title: 'NewPaymentreceived',
            exclude: ['paymentreceivedId'],
          }),
        },
      },
    })
    paymentreceived: Omit<Paymentreceived, 'paymentreceivedId'>,
  ): Promise<Paymentreceived> {
    return this.paymentreceivedRepository.create(paymentreceived);
  }

  @get('/paymentsreceived/count', {
    responses: {
      '200': {
        description: 'Paymentreceived model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Paymentreceived) where?: Where<Paymentreceived>,
  ): Promise<Count> {
    return this.paymentreceivedRepository.count(where);
  }

  @get('/paymentsreceived', {
    responses: {
      '200': {
        description: 'Array of Paymentreceived model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Paymentreceived, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Paymentreceived) filter?: Filter<Paymentreceived>,
  ): Promise<Paymentreceived[]> {
    return this.paymentreceivedRepository.find(filter);
  }

  @patch('/paymentsreceived', {
    responses: {
      '200': {
        description: 'Paymentreceived PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymentreceived, {partial: true}),
        },
      },
    })
    paymentreceived: Paymentreceived,
    @param.where(Paymentreceived) where?: Where<Paymentreceived>,
  ): Promise<Count> {
    return this.paymentreceivedRepository.updateAll(paymentreceived, where);
  }

  @get('/paymentsreceived/{id}', {
    responses: {
      '200': {
        description: 'Paymentreceived model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Paymentreceived, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Paymentreceived, {exclude: 'where'}) filter?: FilterExcludingWhere<Paymentreceived>
  ): Promise<Paymentreceived> {
    return this.paymentreceivedRepository.findById(id, filter);
  }

  @patch('/paymentsreceived/{id}', {
    responses: {
      '204': {
        description: 'Paymentreceived PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymentreceived, {partial: true}),
        },
      },
    })
    paymentreceived: Paymentreceived,
  ): Promise<void> {
    await this.paymentreceivedRepository.updateById(id, paymentreceived);
  }

  @put('/paymentsreceived/{id}', {
    responses: {
      '204': {
        description: 'Paymentreceived PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() paymentreceived: Paymentreceived,
  ): Promise<void> {
    await this.paymentreceivedRepository.replaceById(id, paymentreceived);
  }

  @del('/paymentsreceived/{id}', {
    responses: {
      '204': {
        description: 'Paymentreceived DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.paymentreceivedRepository.deleteById(id);
  }
}
