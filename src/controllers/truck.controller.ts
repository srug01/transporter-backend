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
import {Truck} from '../models';
import {TruckRepository} from '../repositories';

export class TruckController {
  constructor(
    @repository(TruckRepository)
    public truckRepository : TruckRepository,
  ) {}

  @post('/trucks', {
    responses: {
      '200': {
        description: 'Truck model instance',
        content: {'application/json': {schema: getModelSchemaRef(Truck)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Truck, {
            title: 'NewTruck',
            exclude: ['truckId'],
          }),
        },
      },
    })
    truck: Omit<Truck, 'truckId'>,
  ): Promise<Truck> {
    return this.truckRepository.create(truck);
  }

  @get('/trucks/count', {
    responses: {
      '200': {
        description: 'Truck model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Truck) where?: Where<Truck>,
  ): Promise<Count> {
    return this.truckRepository.count(where);
  }

  @get('/trucks', {
    responses: {
      '200': {
        description: 'Array of Truck model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Truck, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Truck) filter?: Filter<Truck>,
  ): Promise<Truck[]> {
    return this.truckRepository.find(filter);
  }

  @patch('/trucks', {
    responses: {
      '200': {
        description: 'Truck PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Truck, {partial: true}),
        },
      },
    })
    truck: Truck,
    @param.where(Truck) where?: Where<Truck>,
  ): Promise<Count> {
    return this.truckRepository.updateAll(truck, where);
  }

  @get('/trucks/{id}', {
    responses: {
      '200': {
        description: 'Truck model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Truck, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Truck, {exclude: 'where'}) filter?: FilterExcludingWhere<Truck>
  ): Promise<Truck> {
    return this.truckRepository.findById(id, filter);
  }

  @patch('/trucks/{id}', {
    responses: {
      '204': {
        description: 'Truck PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Truck, {partial: true}),
        },
      },
    })
    truck: Truck,
  ): Promise<void> {
    await this.truckRepository.updateById(id, truck);
  }

  @put('/trucks/{id}', {
    responses: {
      '204': {
        description: 'Truck PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() truck: Truck,
  ): Promise<void> {
    await this.truckRepository.replaceById(id, truck);
  }

  @del('/trucks/{id}', {
    responses: {
      '204': {
        description: 'Truck DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.truckRepository.deleteById(id);
  }
}
