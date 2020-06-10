import {authenticate} from '@loopback/authentication';
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
import {Vehicle} from '../models';
import {VehicleRepository} from '../repositories';

export class VehicleController {
  constructor(
    @repository(VehicleRepository)
    public vehicleRepository: VehicleRepository,
  ) {}

  @post('/vehicles', {
    responses: {
      '200': {
        description: 'Vehicle model instance',
        content: {'application/json': {schema: getModelSchemaRef(Vehicle)}},
      },
    },
  })
  //@authenticate('jwt', {required: [PermissionKeys.CreateVehicle]})
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vehicle, {
            title: 'NewVehicle',
            exclude: ['id'],
          }),
        },
      },
    })
    vehicle: Omit<Vehicle, 'id'>,
  ): Promise<Vehicle> {
    return this.vehicleRepository.create(vehicle);
  }

  @get('/vehicles/count', {
    responses: {
      '200': {
        description: 'Vehicle model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(@param.where(Vehicle) where?: Where<Vehicle>): Promise<Count> {
    return this.vehicleRepository.count(where);
  }

  @get('/vehicles', {
    responses: {
      '200': {
        description: 'Array of Vehicle model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Vehicle, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(Vehicle) filter?: Filter<Vehicle>,
  ): Promise<Vehicle[]> {
    return this.vehicleRepository.find(filter);
  }

  @patch('/vehicles', {
    responses: {
      '200': {
        description: 'Vehicle PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vehicle, {partial: true}),
        },
      },
    })
    vehicle: Vehicle,
    @param.where(Vehicle) where?: Where<Vehicle>,
  ): Promise<Count> {
    return this.vehicleRepository.updateAll(vehicle, where);
  }

  @get('/vehicles/{id}', {
    responses: {
      '200': {
        description: 'Vehicle model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Vehicle, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Vehicle, {exclude: 'where'})
    filter?: FilterExcludingWhere<Vehicle>,
  ): Promise<Vehicle> {
    return this.vehicleRepository.findById(id, filter);
  }

  @patch('/vehicles/{id}', {
    responses: {
      '204': {
        description: 'Vehicle PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vehicle, {partial: true}),
        },
      },
    })
    vehicle: Vehicle,
  ): Promise<void> {
    await this.vehicleRepository.updateById(id, vehicle);
  }

  @put('/vehicles/{id}', {
    responses: {
      '204': {
        description: 'Vehicle PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() vehicle: Vehicle,
  ): Promise<void> {
    await this.vehicleRepository.replaceById(id, vehicle);
  }

  @del('/vehicles/{id}', {
    responses: {
      '204': {
        description: 'Vehicle DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.vehicleRepository.deleteById(id);
  }
}
