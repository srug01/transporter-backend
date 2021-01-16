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
  Container, Order
} from '../models';
import {OrderRepository} from '../repositories';
@authenticate('jwt')
export class OrderContainerController {
  constructor(
    @repository(OrderRepository) protected orderRepository: OrderRepository,
  ) { }

  @get('/orders/{id}/containers', {
    responses: {
      '200': {
        description: 'Array of Order has many Container',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Container)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Container>,
  ): Promise<Container[]> {
    return this.orderRepository.containers(id).find(filter);
  }

  @post('/orders/{id}/containers', {
    responses: {
      '200': {
        description: 'Order model instance',
        content: {'application/json': {schema: getModelSchemaRef(Container)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Order.prototype.orderId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Container, {
            title: 'NewContainerInOrder',
            exclude: ['containerId'],
            optional: ['orderId']
          }),
        },
      },
    }) container: Omit<Container, 'containerId'>,
  ): Promise<Container> {
    return this.orderRepository.containers(id).create(container);
  }

  @patch('/orders/{id}/containers', {
    responses: {
      '200': {
        description: 'Order.Container PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Container, {partial: true}),
        },
      },
    })
    container: Partial<Container>,
    @param.query.object('where', getWhereSchemaFor(Container)) where?: Where<Container>,
  ): Promise<Count> {
    return this.orderRepository.containers(id).patch(container, where);
  }

  @del('/orders/{id}/containers', {
    responses: {
      '200': {
        description: 'Order.Container DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Container)) where?: Where<Container>,
  ): Promise<Count> {
    return this.orderRepository.containers(id).delete(where);
  }
}
