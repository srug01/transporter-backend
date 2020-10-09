/* eslint-disable @typescript-eslint/no-unused-vars */
import {inject} from '@loopback/core';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  param,
  patch,
  post,
  put,
  requestBody,
} from '@loopback/rest';
import {CallProcedureServiceBindings} from '../keys';
import {Order, Truck} from '../models';
import {ContainerRepository, OrderRepository} from '../repositories';
import {Container} from './../models/container.model';
import {CallProcedureService} from './../services/call-procedure.service';

export class OrderController {
  constructor(
    @repository(OrderRepository)
    public orderRepository: OrderRepository,
    @repository(ContainerRepository)
    public containerRepository: ContainerRepository,
    @inject(CallProcedureServiceBindings.CALL_PROCEDURE_SERVICE)
    public _callProcedureService: CallProcedureService,
  ) {}

  @post('/orders', {
    responses: {
      '200': {
        description: 'Order model instance',
        content: {'application/json': {schema: getModelSchemaRef(Order)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Order, {
            title: 'NewOrder',
            exclude: ['orderId'],
          }),
        },
      },
    })
    order: Omit<Order, 'orderId'>,
  ): Promise<Order> {
    // let tx: Transaction;
    // tx = await this.orderRepository.beginTransaction(
    //   IsolationLevel.READ_COMMITTED,
    // );
    const containers: Container[] = order.containers;
    console.log(containers);
    delete order.containers;
    console.log(order);
    const createdOrder = await this.orderRepository.create(order);
    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for (let i = 0; i < containers.length; i++) {
      const container = containers[i];
      const trucks: Truck[] = container.trucks;
      delete container.trucks;
      container.orderId = createdOrder.getId();
      const createdContainer = await this.orderRepository
        .containers(createdOrder.getId())
        .create(container);
      // for (const truck of trucks) {
      //   truck.containerId = createdContainer.getId();
      //   this.containerRepository.trucks(createdContainer.getId()).create(truck);
      // }
      const truckCount = createdContainer?.numberOfTrucks ?? 0;
      if (truckCount > 0) {
        for (let j = 0; j < truckCount; j++) {
          const truck: Truck = new Truck();
          truck.containerId = createdContainer.getId();
          if (trucks[j] === undefined) {
            truck.truckNumber = '';
          } else {
            truck.truckNumber = trucks[j].truckNumber;
          }
          const data = await this.containerRepository
            .trucks(createdContainer.getId())
            .create(truck);
        }
      }
    }
    const placebid = await this._callProcedureService.PostOrderProcessing(
      createdOrder.getId(),
    );
    return createdOrder;
  }

  @get('/orders/count', {
    responses: {
      '200': {
        description: 'Order model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(@param.where(Order) where?: Where<Order>): Promise<Count> {
    return this.orderRepository.count(where);
  }

  @get('/orders', {
    responses: {
      '200': {
        description: 'Array of Order model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Order, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(@param.filter(Order) filter?: Filter<Order>): Promise<Order[]> {
    return this.orderRepository.find(filter);
  }

  @patch('/orders', {
    responses: {
      '200': {
        description: 'Order PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Order, {partial: true}),
        },
      },
    })
    order: Order,
    @param.where(Order) where?: Where<Order>,
  ): Promise<Count> {
    return this.orderRepository.updateAll(order, where);
  }

  @get('/orders/{id}', {
    responses: {
      '200': {
        description: 'Order model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Order, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Order, {exclude: 'where'})
    filter?: FilterExcludingWhere<Order>,
  ): Promise<Order> {
    return this.orderRepository.findById(id, filter);
  }

  @patch('/orders/{id}', {
    responses: {
      '204': {
        description: 'Order PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Order, {partial: true}),
        },
      },
    })
    order: Order,
  ): Promise<void> {
    await this.orderRepository.updateById(id, order);
  }

  @put('/orders/{id}', {
    responses: {
      '204': {
        description: 'Order PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() order: Order,
  ): Promise<void> {
    await this.orderRepository.replaceById(id, order);
  }

  @del('/orders/{id}', {
    responses: {
      '204': {
        description: 'Order DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.orderRepository.deleteById(id);
  }
}
