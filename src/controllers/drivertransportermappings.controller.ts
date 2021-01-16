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
import {Drivertransportermapping} from '../models';
import {DrivertransportermappingRepository} from '../repositories';
@authenticate('jwt')
export class DrivertransportermappingsController {
  constructor(
    @repository(DrivertransportermappingRepository)
    public drivertransportermappingRepository : DrivertransportermappingRepository,
  ) {}

  @post('/drivertransportermappings', {
    responses: {
      '200': {
        description: 'Drivertransportermapping model instance',
        content: {'application/json': {schema: getModelSchemaRef(Drivertransportermapping)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Drivertransportermapping, {
            title: 'NewDrivertransportermapping',
            exclude: ['drivertransportermappingId'],
          }),
        },
      },
    })
    drivertransportermapping: Omit<Drivertransportermapping, 'drivertransportermappingId'>,
  ): Promise<Drivertransportermapping> {
    return this.drivertransportermappingRepository.create(drivertransportermapping);
  }

  @get('/drivertransportermappings/count', {
    responses: {
      '200': {
        description: 'Drivertransportermapping model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Drivertransportermapping) where?: Where<Drivertransportermapping>,
  ): Promise<Count> {
    return this.drivertransportermappingRepository.count(where);
  }

  @get('/drivertransportermappings', {
    responses: {
      '200': {
        description: 'Array of Drivertransportermapping model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Drivertransportermapping, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Drivertransportermapping) filter?: Filter<Drivertransportermapping>,
  ): Promise<Drivertransportermapping[]> {
    return this.drivertransportermappingRepository.find(filter);
  }

  @patch('/drivertransportermappings', {
    responses: {
      '200': {
        description: 'Drivertransportermapping PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Drivertransportermapping, {partial: true}),
        },
      },
    })
    drivertransportermapping: Drivertransportermapping,
    @param.where(Drivertransportermapping) where?: Where<Drivertransportermapping>,
  ): Promise<Count> {
    return this.drivertransportermappingRepository.updateAll(drivertransportermapping, where);
  }

  @get('/drivertransportermappings/{id}', {
    responses: {
      '200': {
        description: 'Drivertransportermapping model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Drivertransportermapping, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Drivertransportermapping, {exclude: 'where'}) filter?: FilterExcludingWhere<Drivertransportermapping>
  ): Promise<Drivertransportermapping> {
    return this.drivertransportermappingRepository.findById(id, filter);
  }

  @patch('/drivertransportermappings/{id}', {
    responses: {
      '204': {
        description: 'Drivertransportermapping PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Drivertransportermapping, {partial: true}),
        },
      },
    })
    drivertransportermapping: Drivertransportermapping,
  ): Promise<void> {
    await this.drivertransportermappingRepository.updateById(id, drivertransportermapping);
  }

  @put('/drivertransportermappings/{id}', {
    responses: {
      '204': {
        description: 'Drivertransportermapping PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() drivertransportermapping: Drivertransportermapping,
  ): Promise<void> {
    await this.drivertransportermappingRepository.replaceById(id, drivertransportermapping);
  }

  @del('/drivertransportermappings/{id}', {
    responses: {
      '204': {
        description: 'Drivertransportermapping DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.drivertransportermappingRepository.deleteById(id);
  }
}
