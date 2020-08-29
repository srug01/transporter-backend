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
import {Userratings} from '../models';
import {UserratingsRepository} from '../repositories';

export class UserratingsController {
  constructor(
    @repository(UserratingsRepository)
    public userratingsRepository : UserratingsRepository,
  ) {}

  @post('/userratings', {
    responses: {
      '200': {
        description: 'Userratings model instance',
        content: {'application/json': {schema: getModelSchemaRef(Userratings)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userratings, {
            title: 'NewUserratings',
            exclude: ['userratingId'],
          }),
        },
      },
    })
    userratings: Omit<Userratings, 'userratingId'>,
  ): Promise<Userratings> {
    return this.userratingsRepository.create(userratings);
  }

  @get('/userratings/count', {
    responses: {
      '200': {
        description: 'Userratings model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Userratings) where?: Where<Userratings>,
  ): Promise<Count> {
    return this.userratingsRepository.count(where);
  }

  @get('/userratings', {
    responses: {
      '200': {
        description: 'Array of Userratings model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Userratings, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Userratings) filter?: Filter<Userratings>,
  ): Promise<Userratings[]> {
    return this.userratingsRepository.find(filter);
  }

  @patch('/userratings', {
    responses: {
      '200': {
        description: 'Userratings PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userratings, {partial: true}),
        },
      },
    })
    userratings: Userratings,
    @param.where(Userratings) where?: Where<Userratings>,
  ): Promise<Count> {
    return this.userratingsRepository.updateAll(userratings, where);
  }

  @get('/userratings/{id}', {
    responses: {
      '200': {
        description: 'Userratings model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Userratings, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Userratings, {exclude: 'where'}) filter?: FilterExcludingWhere<Userratings>
  ): Promise<Userratings> {
    return this.userratingsRepository.findById(id, filter);
  }

  @patch('/userratings/{id}', {
    responses: {
      '204': {
        description: 'Userratings PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userratings, {partial: true}),
        },
      },
    })
    userratings: Userratings,
  ): Promise<void> {
    await this.userratingsRepository.updateById(id, userratings);
  }

  @put('/userratings/{id}', {
    responses: {
      '204': {
        description: 'Userratings PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() userratings: Userratings,
  ): Promise<void> {
    await this.userratingsRepository.replaceById(id, userratings);
  }

  @del('/userratings/{id}', {
    responses: {
      '204': {
        description: 'Userratings DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.userratingsRepository.deleteById(id);
  }
}
