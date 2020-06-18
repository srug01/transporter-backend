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
import {Ordercontainerdetails, Orders} from '../models';
import {OrdersRepository} from '../repositories';

export class OrdersOrdercontainerdetailsController {
  constructor(
    @repository(OrdersRepository) protected ordersRepository: OrdersRepository,
  ) {}

  @get('/orders/{id}/ordercontainerdetails', {
    responses: {
      '200': {
        description: 'Array of Orders has many Ordercontainerdetails',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Ordercontainerdetails),
            },
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Ordercontainerdetails>,
  ): Promise<Ordercontainerdetails[]> {
    return this.ordersRepository.ordercontainers(id).find(filter);
  }

  @post('/orders/{id}/ordercontainerdetails', {
    responses: {
      '200': {
        description: 'Orders model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Ordercontainerdetails),
          },
        },
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Orders.prototype.order_syscode,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Ordercontainerdetails, {
            title: 'NewOrdercontainerdetailsInOrders',
            exclude: ['order_container_syscode'],
            //optional: ['order_syscode'],
          }),
        },
      },
    })
    ordercontainerdetails: Omit<
      Ordercontainerdetails,
      'order_container_syscode'
    >,
  ): Promise<Ordercontainerdetails> {
    return this.ordersRepository
      .ordercontainers(id)
      .create(ordercontainerdetails);
  }

  @patch('/orders/{id}/ordercontainerdetails', {
    responses: {
      '200': {
        description: 'Orders.Ordercontainerdetails PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Ordercontainerdetails, {partial: true}),
        },
      },
    })
    ordercontainerdetails: Partial<Ordercontainerdetails>,
    @param.query.object('where', getWhereSchemaFor(Ordercontainerdetails))
    where?: Where<Ordercontainerdetails>,
  ): Promise<Count> {
    return this.ordersRepository
      .ordercontainers(id)
      .patch(ordercontainerdetails, where);
  }

  @del('/orders/{id}/ordercontainerdetails', {
    responses: {
      '200': {
        description: 'Orders.Ordercontainerdetails DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Ordercontainerdetails))
    where?: Where<Ordercontainerdetails>,
  ): Promise<Count> {
    return this.ordersRepository.ordercontainers(id).delete(where);
  }
}
