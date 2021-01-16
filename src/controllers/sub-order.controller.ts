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
import {SubOrder} from '../models';
import {SubOrderRepository} from '../repositories';
@authenticate('jwt')
export class SubOrderController {
  constructor(
    @repository(SubOrderRepository)
    public subOrderRepository : SubOrderRepository,
  ) {}

  @post('/sub-orders', {
    responses: {
      '200': {
        description: 'SubOrder model instance',
        content: {'application/json': {schema: getModelSchemaRef(SubOrder)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SubOrder, {
            title: 'NewSubOrder',
            exclude: ['subOrderId'],
          }),
        },
      },
    })
    subOrder: Omit<SubOrder, 'subOrderId'>,
  ): Promise<SubOrder> {
    return this.subOrderRepository.create(subOrder);
  }

  @get('/sub-orders/count', {
    responses: {
      '200': {
        description: 'SubOrder model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(SubOrder) where?: Where<SubOrder>,
  ): Promise<Count> {
    return this.subOrderRepository.count(where);
  }

  @get('/sub-orders', {
    responses: {
      '200': {
        description: 'Array of SubOrder model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(SubOrder, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(SubOrder) filter?: Filter<SubOrder>,
  ): Promise<SubOrder[]> {
    return this.subOrderRepository.find(filter);
  }

  @patch('/sub-orders', {
    responses: {
      '200': {
        description: 'SubOrder PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SubOrder, {partial: true}),
        },
      },
    })
    subOrder: SubOrder,
    @param.where(SubOrder) where?: Where<SubOrder>,
  ): Promise<Count> {
    return this.subOrderRepository.updateAll(subOrder, where);
  }

  @get('/sub-orders/{id}', {
    responses: {
      '200': {
        description: 'SubOrder model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(SubOrder, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(SubOrder, {exclude: 'where'}) filter?: FilterExcludingWhere<SubOrder>
  ): Promise<SubOrder> {
    return this.subOrderRepository.findById(id, filter);
  }

  @patch('/sub-orders/{id}', {
    responses: {
      '204': {
        description: 'SubOrder PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SubOrder, {partial: true}),
        },
      },
    })
    subOrder: SubOrder,
  ): Promise<void> {
    await this.subOrderRepository.updateById(id, subOrder);
  }

  @put('/sub-orders/{id}', {
    responses: {
      '204': {
        description: 'SubOrder PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() subOrder: SubOrder,
  ): Promise<void> {
    await this.subOrderRepository.replaceById(id, subOrder);
  }

  @del('/sub-orders/{id}', {
    responses: {
      '204': {
        description: 'SubOrder DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.subOrderRepository.deleteById(id);
  }
}
