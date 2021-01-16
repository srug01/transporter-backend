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
import {Vehicletransportermapping} from '../models';
import {VehicletransportermappingRepository} from '../repositories';
@authenticate('jwt')
export class VehicletransportermappingController {
  constructor(
    @repository(VehicletransportermappingRepository)
    public vehicletransportermappingRepository : VehicletransportermappingRepository,
  ) {}

  @post('/vehicletransportermappings', {
    responses: {
      '200': {
        description: 'Vehicletransportermapping model instance',
        content: {'application/json': {schema: getModelSchemaRef(Vehicletransportermapping)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vehicletransportermapping, {
            title: 'NewVehicletransportermapping',
            exclude: ['vehicletransportermappingId'],
          }),
        },
      },
    })
    vehicletransportermapping: Omit<Vehicletransportermapping, 'vehicletransportermappingId'>,
  ): Promise<Vehicletransportermapping> {
    return this.vehicletransportermappingRepository.create(vehicletransportermapping);
  }

  @get('/vehicletransportermappings/count', {
    responses: {
      '200': {
        description: 'Vehicletransportermapping model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Vehicletransportermapping) where?: Where<Vehicletransportermapping>,
  ): Promise<Count> {
    return this.vehicletransportermappingRepository.count(where);
  }

  @get('/vehicletransportermappings', {
    responses: {
      '200': {
        description: 'Array of Vehicletransportermapping model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Vehicletransportermapping, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Vehicletransportermapping) filter?: Filter<Vehicletransportermapping>,
  ): Promise<Vehicletransportermapping[]> {
    return this.vehicletransportermappingRepository.find(filter);
  }

  @patch('/vehicletransportermappings', {
    responses: {
      '200': {
        description: 'Vehicletransportermapping PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vehicletransportermapping, {partial: true}),
        },
      },
    })
    vehicletransportermapping: Vehicletransportermapping,
    @param.where(Vehicletransportermapping) where?: Where<Vehicletransportermapping>,
  ): Promise<Count> {
    return this.vehicletransportermappingRepository.updateAll(vehicletransportermapping, where);
  }

  @get('/vehicletransportermappings/{id}', {
    responses: {
      '200': {
        description: 'Vehicletransportermapping model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Vehicletransportermapping, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Vehicletransportermapping, {exclude: 'where'}) filter?: FilterExcludingWhere<Vehicletransportermapping>
  ): Promise<Vehicletransportermapping> {
    return this.vehicletransportermappingRepository.findById(id, filter);
  }

  @patch('/vehicletransportermappings/{id}', {
    responses: {
      '204': {
        description: 'Vehicletransportermapping PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Vehicletransportermapping, {partial: true}),
        },
      },
    })
    vehicletransportermapping: Vehicletransportermapping,
  ): Promise<void> {
    await this.vehicletransportermappingRepository.updateById(id, vehicletransportermapping);
  }

  @put('/vehicletransportermappings/{id}', {
    responses: {
      '204': {
        description: 'Vehicletransportermapping PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() vehicletransportermapping: Vehicletransportermapping,
  ): Promise<void> {
    await this.vehicletransportermappingRepository.replaceById(id, vehicletransportermapping);
  }

  @del('/vehicletransportermappings/{id}', {
    responses: {
      '204': {
        description: 'Vehicletransportermapping DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.vehicletransportermappingRepository.deleteById(id);
  }
}
