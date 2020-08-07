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
import {Permissionrolemapping} from '../models';
import {PermissionrolemappingRepository} from '../repositories';

export class PermissionrolemappingController {
  constructor(
    @repository(PermissionrolemappingRepository)
    public permissionrolemappingRepository : PermissionrolemappingRepository,
  ) {}

  @post('/permissionrolemappings', {
    responses: {
      '200': {
        description: 'Permissionrolemapping model instance',
        content: {'application/json': {schema: getModelSchemaRef(Permissionrolemapping)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Permissionrolemapping, {
            title: 'NewPermissionrolemapping',
            exclude: ['permissionroleId'],
          }),
        },
      },
    })
    permissionrolemapping: Omit<Permissionrolemapping, 'permissionroleId'>,
  ): Promise<Permissionrolemapping> {
    return this.permissionrolemappingRepository.create(permissionrolemapping);
  }

  @get('/permissionrolemappings/count', {
    responses: {
      '200': {
        description: 'Permissionrolemapping model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Permissionrolemapping) where?: Where<Permissionrolemapping>,
  ): Promise<Count> {
    return this.permissionrolemappingRepository.count(where);
  }

  @get('/permissionrolemappings', {
    responses: {
      '200': {
        description: 'Array of Permissionrolemapping model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Permissionrolemapping, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Permissionrolemapping) filter?: Filter<Permissionrolemapping>,
  ): Promise<Permissionrolemapping[]> {
    return this.permissionrolemappingRepository.find(filter);
  }

  @patch('/permissionrolemappings', {
    responses: {
      '200': {
        description: 'Permissionrolemapping PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Permissionrolemapping, {partial: true}),
        },
      },
    })
    permissionrolemapping: Permissionrolemapping,
    @param.where(Permissionrolemapping) where?: Where<Permissionrolemapping>,
  ): Promise<Count> {
    return this.permissionrolemappingRepository.updateAll(permissionrolemapping, where);
  }

  @get('/permissionrolemappings/{id}', {
    responses: {
      '200': {
        description: 'Permissionrolemapping model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Permissionrolemapping, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Permissionrolemapping, {exclude: 'where'}) filter?: FilterExcludingWhere<Permissionrolemapping>
  ): Promise<Permissionrolemapping> {
    return this.permissionrolemappingRepository.findById(id, filter);
  }

  @patch('/permissionrolemappings/{id}', {
    responses: {
      '204': {
        description: 'Permissionrolemapping PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Permissionrolemapping, {partial: true}),
        },
      },
    })
    permissionrolemapping: Permissionrolemapping,
  ): Promise<void> {
    await this.permissionrolemappingRepository.updateById(id, permissionrolemapping);
  }

  @put('/permissionrolemappings/{id}', {
    responses: {
      '204': {
        description: 'Permissionrolemapping PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() permissionrolemapping: Permissionrolemapping,
  ): Promise<void> {
    await this.permissionrolemappingRepository.replaceById(id, permissionrolemapping);
  }

  @del('/permissionrolemappings/{id}', {
    responses: {
      '204': {
        description: 'Permissionrolemapping DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.permissionrolemappingRepository.deleteById(id);
  }
}
