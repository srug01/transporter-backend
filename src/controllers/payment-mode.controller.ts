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
import {PaymentMode} from '../models';
import {PaymentModeRepository} from '../repositories';

export class PaymentModeController {
  constructor(
    @repository(PaymentModeRepository)
    public paymentModeRepository : PaymentModeRepository,
  ) {}

  @post('/payment-modes', {
    responses: {
      '200': {
        description: 'PaymentMode model instance',
        content: {'application/json': {schema: getModelSchemaRef(PaymentMode)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentMode, {
            title: 'NewPaymentMode',
            exclude: ['paymentModeId'],
          }),
        },
      },
    })
    paymentMode: Omit<PaymentMode, 'paymentModeId'>,
  ): Promise<PaymentMode> {
    return this.paymentModeRepository.create(paymentMode);
  }

  @get('/payment-modes/count', {
    responses: {
      '200': {
        description: 'PaymentMode model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PaymentMode) where?: Where<PaymentMode>,
  ): Promise<Count> {
    return this.paymentModeRepository.count(where);
  }

  @get('/payment-modes', {
    responses: {
      '200': {
        description: 'Array of PaymentMode model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PaymentMode, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PaymentMode) filter?: Filter<PaymentMode>,
  ): Promise<PaymentMode[]> {
    return this.paymentModeRepository.find(filter);
  }

  @patch('/payment-modes', {
    responses: {
      '200': {
        description: 'PaymentMode PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentMode, {partial: true}),
        },
      },
    })
    paymentMode: PaymentMode,
    @param.where(PaymentMode) where?: Where<PaymentMode>,
  ): Promise<Count> {
    return this.paymentModeRepository.updateAll(paymentMode, where);
  }

  @get('/payment-modes/{id}', {
    responses: {
      '200': {
        description: 'PaymentMode model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PaymentMode, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PaymentMode, {exclude: 'where'}) filter?: FilterExcludingWhere<PaymentMode>
  ): Promise<PaymentMode> {
    return this.paymentModeRepository.findById(id, filter);
  }

  @patch('/payment-modes/{id}', {
    responses: {
      '204': {
        description: 'PaymentMode PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentMode, {partial: true}),
        },
      },
    })
    paymentMode: PaymentMode,
  ): Promise<void> {
    await this.paymentModeRepository.updateById(id, paymentMode);
  }

  @put('/payment-modes/{id}', {
    responses: {
      '204': {
        description: 'PaymentMode PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() paymentMode: PaymentMode,
  ): Promise<void> {
    await this.paymentModeRepository.replaceById(id, paymentMode);
  }

  @del('/payment-modes/{id}', {
    responses: {
      '204': {
        description: 'PaymentMode DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.paymentModeRepository.deleteById(id);
  }
}
