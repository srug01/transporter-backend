import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {VehicleMaster} from '../models';
import {VehicleMasterRepository} from '../repositories';

export class VehicleMasterController {
  constructor(
    @repository(VehicleMasterRepository)
    public vehicleMasterRepository: VehicleMasterRepository,
  ) {}

  @post('/vehicle-masters', {
    responses: {
      '200': {
        description: 'VehicleMaster model instance',
        content: {
          'application/json': {schema: getModelSchemaRef(VehicleMaster)},
        },
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(VehicleMaster, {
            title: 'NewVehicleMaster',
          }),
        },
      },
    })
    vehicleMaster: VehicleMaster,
  ): Promise<VehicleMaster> {
    return this.vehicleMasterRepository.create(vehicleMaster);
  }

  @get('/vehicle-masters/count', {
    responses: {
      '200': {
        description: 'VehicleMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(VehicleMaster) where?: Where<VehicleMaster>,
  ): Promise<Count> {
    return this.vehicleMasterRepository.count(where);
  }

  @get('/vehicle-masters', {
    responses: {
      '200': {
        description: 'Array of VehicleMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(VehicleMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(VehicleMaster) filter?: Filter<VehicleMaster>,
  ): Promise<VehicleMaster[]> {
    return this.vehicleMasterRepository.find(filter);
  }

  @patch('/vehicle-masters', {
    responses: {
      '200': {
        description: 'VehicleMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(VehicleMaster, {partial: true}),
        },
      },
    })
    vehicleMaster: VehicleMaster,
    @param.where(VehicleMaster) where?: Where<VehicleMaster>,
  ): Promise<Count> {
    return this.vehicleMasterRepository.updateAll(vehicleMaster, where);
  }

  @get('/vehicle-masters/{id}', {
    responses: {
      '200': {
        description: 'VehicleMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(VehicleMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(VehicleMaster, {exclude: 'where'})
    filter?: FilterExcludingWhere<VehicleMaster>,
  ): Promise<VehicleMaster> {
    return this.vehicleMasterRepository.findById(id, filter);
  }

  @patch('/vehicle-masters/{id}', {
    responses: {
      '204': {
        description: 'VehicleMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(VehicleMaster, {partial: true}),
        },
      },
    })
    vehicleMaster: VehicleMaster,
  ): Promise<void> {
    await this.vehicleMasterRepository.updateById(id, vehicleMaster);
  }

  @put('/vehicle-masters/{id}', {
    responses: {
      '204': {
        description: 'VehicleMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() vehicleMaster: VehicleMaster,
  ): Promise<void> {
    await this.vehicleMasterRepository.replaceById(id, vehicleMaster);
  }

  @del('/vehicle-masters/{id}', {
    responses: {
      '204': {
        description: 'VehicleMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.vehicleMasterRepository.deleteById(id);
  }
}
