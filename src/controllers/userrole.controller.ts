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
import {Userrole} from '../models';
import {UserroleRepository} from '../repositories';

export class UserroleController {
  constructor(
    @repository(UserroleRepository)
    public userroleRepository : UserroleRepository,
  ) {}

  @post('/userroles', {
    responses: {
      '200': {
        description: 'Userrole model instance',
        content: {'application/json': {schema: getModelSchemaRef(Userrole)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userrole, {
            title: 'NewUserrole',
            exclude: ['roleId'],
          }),
        },
      },
    })
    userrole: Omit<Userrole, 'roleId'>,
  ): Promise<Userrole> {
    return this.userroleRepository.create(userrole);
  }

  @get('/userroles/count', {
    responses: {
      '200': {
        description: 'Userrole model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Userrole) where?: Where<Userrole>,
  ): Promise<Count> {
    return this.userroleRepository.count(where);
  }

  @get('/userroles', {
    responses: {
      '200': {
        description: 'Array of Userrole model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Userrole, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Userrole) filter?: Filter<Userrole>,
  ): Promise<Userrole[]> {
    return this.userroleRepository.find(filter);
  }

  @patch('/userroles', {
    responses: {
      '200': {
        description: 'Userrole PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userrole, {partial: true}),
        },
      },
    })
    userrole: Userrole,
    @param.where(Userrole) where?: Where<Userrole>,
  ): Promise<Count> {
    return this.userroleRepository.updateAll(userrole, where);
  }

  @get('/userroles/{id}', {
    responses: {
      '200': {
        description: 'Userrole model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Userrole, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Userrole, {exclude: 'where'}) filter?: FilterExcludingWhere<Userrole>
  ): Promise<Userrole> {
    return this.userroleRepository.findById(id, filter);
  }

  @patch('/userroles/{id}', {
    responses: {
      '204': {
        description: 'Userrole PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userrole, {partial: true}),
        },
      },
    })
    userrole: Userrole,
  ): Promise<void> {
    await this.userroleRepository.updateById(id, userrole);
  }

  @put('/userroles/{id}', {
    responses: {
      '204': {
        description: 'Userrole PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() userrole: Userrole,
  ): Promise<void> {
    await this.userroleRepository.replaceById(id, userrole);
  }

  @del('/userroles/{id}', {
    responses: {
      '204': {
        description: 'Userrole DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.userroleRepository.deleteById(id);
  }
}
