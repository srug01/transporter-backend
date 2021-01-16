import {authenticate} from '@loopback/authentication';
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
import {PaymentType} from '../models';
import {PaymentTypeRepository} from '../repositories';
@authenticate('jwt')
export class PaymentTypeController {
  constructor(
    @repository(PaymentTypeRepository)
    public paymentTypeRepository : PaymentTypeRepository,
  ) {}

  @post('/payment-types', {
    responses: {
      '200': {
        description: 'PaymentType model instance',
        content: {'application/json': {schema: getModelSchemaRef(PaymentType)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentType, {
            title: 'NewPaymentType',
            exclude: ['paymentTypeId'],
          }),
        },
      },
    })
    paymentType: Omit<PaymentType, 'paymentTypeId'>,
  ): Promise<PaymentType> {
    return this.paymentTypeRepository.create(paymentType);
  }

  @get('/payment-types/count', {
    responses: {
      '200': {
        description: 'PaymentType model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PaymentType) where?: Where<PaymentType>,
  ): Promise<Count> {
    return this.paymentTypeRepository.count(where);
  }

  @get('/payment-types', {
    responses: {
      '200': {
        description: 'Array of PaymentType model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PaymentType, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(PaymentType) filter?: Filter<PaymentType>,
  ): Promise<PaymentType[]> {
    return this.paymentTypeRepository.find(filter);
  }

  @patch('/payment-types', {
    responses: {
      '200': {
        description: 'PaymentType PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentType, {partial: true}),
        },
      },
    })
    paymentType: PaymentType,
    @param.where(PaymentType) where?: Where<PaymentType>,
  ): Promise<Count> {
    return this.paymentTypeRepository.updateAll(paymentType, where);
  }

  @get('/payment-types/{id}', {
    responses: {
      '200': {
        description: 'PaymentType model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PaymentType, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PaymentType, {exclude: 'where'}) filter?: FilterExcludingWhere<PaymentType>
  ): Promise<PaymentType> {
    return this.paymentTypeRepository.findById(id, filter);
  }

  @patch('/payment-types/{id}', {
    responses: {
      '204': {
        description: 'PaymentType PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PaymentType, {partial: true}),
        },
      },
    })
    paymentType: PaymentType,
  ): Promise<void> {
    await this.paymentTypeRepository.updateById(id, paymentType);
  }

  @put('/payment-types/{id}', {
    responses: {
      '204': {
        description: 'PaymentType PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() paymentType: PaymentType,
  ): Promise<void> {
    await this.paymentTypeRepository.replaceById(id, paymentType);
  }

  @del('/payment-types/{id}', {
    responses: {
      '204': {
        description: 'PaymentType DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.paymentTypeRepository.deleteById(id);
  }
}
