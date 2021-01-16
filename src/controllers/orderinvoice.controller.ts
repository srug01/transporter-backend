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
import {Orderinvoice} from '../models';
import {OrderinvoiceRepository} from '../repositories';
@authenticate('jwt')
export class OrderinvoiceController {
  constructor(
    @repository(OrderinvoiceRepository)
    public orderinvoiceRepository : OrderinvoiceRepository,
  ) {}

  @post('/orderinvoices', {
    responses: {
      '200': {
        description: 'Orderinvoice model instance',
        content: {'application/json': {schema: getModelSchemaRef(Orderinvoice)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Orderinvoice, {
            title: 'NewOrderinvoice',
            exclude: ['orderId'],
          }),
        },
      },
    })
    orderinvoice: Omit<Orderinvoice, 'orderId'>,
  ): Promise<Orderinvoice> {
    return this.orderinvoiceRepository.create(orderinvoice);
  }

  @get('/orderinvoices/count', {
    responses: {
      '200': {
        description: 'Orderinvoice model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Orderinvoice) where?: Where<Orderinvoice>,
  ): Promise<Count> {
    return this.orderinvoiceRepository.count(where);
  }

  @get('/orderinvoices', {
    responses: {
      '200': {
        description: 'Array of Orderinvoice model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Orderinvoice, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Orderinvoice) filter?: Filter<Orderinvoice>,
  ): Promise<Orderinvoice[]> {
    return this.orderinvoiceRepository.find(filter);
  }

  @patch('/orderinvoices', {
    responses: {
      '200': {
        description: 'Orderinvoice PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Orderinvoice, {partial: true}),
        },
      },
    })
    orderinvoice: Orderinvoice,
    @param.where(Orderinvoice) where?: Where<Orderinvoice>,
  ): Promise<Count> {
    return this.orderinvoiceRepository.updateAll(orderinvoice, where);
  }

  @get('/orderinvoices/{id}', {
    responses: {
      '200': {
        description: 'Orderinvoice model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Orderinvoice, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Orderinvoice, {exclude: 'where'}) filter?: FilterExcludingWhere<Orderinvoice>
  ): Promise<Orderinvoice> {
    return this.orderinvoiceRepository.findById(id, filter);
  }

  @patch('/orderinvoices/{id}', {
    responses: {
      '204': {
        description: 'Orderinvoice PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Orderinvoice, {partial: true}),
        },
      },
    })
    orderinvoice: Orderinvoice,
  ): Promise<void> {
    await this.orderinvoiceRepository.updateById(id, orderinvoice);
  }

  @put('/orderinvoices/{id}', {
    responses: {
      '204': {
        description: 'Orderinvoice PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() orderinvoice: Orderinvoice,
  ): Promise<void> {
    await this.orderinvoiceRepository.replaceById(id, orderinvoice);
  }

  @del('/orderinvoices/{id}', {
    responses: {
      '204': {
        description: 'Orderinvoice DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.orderinvoiceRepository.deleteById(id);
  }
}
