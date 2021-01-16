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
  Container,
  Truck
} from '../models';
import {ContainerRepository} from '../repositories';
@authenticate('jwt')
export class ContainerTruckController {
  constructor(
    @repository(ContainerRepository) protected containerRepository: ContainerRepository,
  ) { }

  @get('/containers/{id}/trucks', {
    responses: {
      '200': {
        description: 'Array of Container has many Truck',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Truck)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Truck>,
  ): Promise<Truck[]> {
    return this.containerRepository.trucks(id).find(filter);
  }

  @post('/containers/{id}/trucks', {
    responses: {
      '200': {
        description: 'Container model instance',
        content: {'application/json': {schema: getModelSchemaRef(Truck)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof Container.prototype.containerId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Truck, {
            title: 'NewTruckInContainer',
            exclude: ['truckId'],
            optional: ['containerId']
          }),
        },
      },
    }) truck: Omit<Truck, 'truckId'>,
  ): Promise<Truck> {
    return this.containerRepository.trucks(id).create(truck);
  }

  @patch('/containers/{id}/trucks', {
    responses: {
      '200': {
        description: 'Container.Truck PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Truck, {partial: true}),
        },
      },
    })
    truck: Partial<Truck>,
    @param.query.object('where', getWhereSchemaFor(Truck)) where?: Where<Truck>,
  ): Promise<Count> {
    return this.containerRepository.trucks(id).patch(truck, where);
  }

  @del('/containers/{id}/trucks', {
    responses: {
      '200': {
        description: 'Container.Truck DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Truck)) where?: Where<Truck>,
  ): Promise<Count> {
    return this.containerRepository.trucks(id).delete(where);
  }
}
