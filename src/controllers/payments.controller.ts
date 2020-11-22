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
import {Payments} from '../models';
import {PaymentsRepository} from '../repositories';

export class PaymentsController {
  constructor(
    @repository(PaymentsRepository)
    public paymentsRepository : PaymentsRepository,
  ) {}

  @post('/payments', {
    responses: {
      '200': {
        description: 'Payments model instance',
        content: {'application/json': {schema: getModelSchemaRef(Payments)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Payments, {
            title: 'NewPayments',
            exclude: ['paymentId'],
          }),
        },
      },
    })
    payments: Omit<Payments, 'paymentId'>,
  ): Promise<Payments> {
    return this.paymentsRepository.create(payments);
  }

  @get('/payments/count', {
    responses: {
      '200': {
        description: 'Payments model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Payments) where?: Where<Payments>,
  ): Promise<Count> {
    return this.paymentsRepository.count(where);
  }

  @get('/payments', {
    responses: {
      '200': {
        description: 'Array of Payments model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Payments, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Payments) filter?: Filter<Payments>,
  ): Promise<Payments[]> {
    return this.paymentsRepository.find(filter);
  }

  @patch('/payments', {
    responses: {
      '200': {
        description: 'Payments PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Payments, {partial: true}),
        },
      },
    })
    payments: Payments,
    @param.where(Payments) where?: Where<Payments>,
  ): Promise<Count> {
    return this.paymentsRepository.updateAll(payments, where);
  }

  @get('/payments/{id}', {
    responses: {
      '200': {
        description: 'Payments model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Payments, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Payments, {exclude: 'where'}) filter?: FilterExcludingWhere<Payments>
  ): Promise<Payments> {
    return this.paymentsRepository.findById(id, filter);
  }

  @patch('/payments/{id}', {
    responses: {
      '204': {
        description: 'Payments PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Payments, {partial: true}),
        },
      },
    })
    payments: Payments,
  ): Promise<void> {
    await this.paymentsRepository.updateById(id, payments);
  }

  @put('/payments/{id}', {
    responses: {
      '204': {
        description: 'Payments PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() payments: Payments,
  ): Promise<void> {
    await this.paymentsRepository.replaceById(id, payments);
  }

  @del('/payments/{id}', {
    responses: {
      '204': {
        description: 'Payments DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.paymentsRepository.deleteById(id);
  }
}
