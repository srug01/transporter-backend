import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {YardPortMapping} from '../models';
import {YardPortMappingRepository} from '../repositories';

export class YardPortMappingController {
  constructor(
    @repository(YardPortMappingRepository)
    public yardPortMappingRepository: YardPortMappingRepository,
  ) {}

  @post('/yard-port-mappings', {
    responses: {
      '200': {
        description: 'YardPortMapping model instance',
        content: {'application/json': {schema: getModelSchemaRef(YardPortMapping)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardPortMapping, {
            title: 'NewYardPortMapping',

          }),
        },
      },
    })
    yardPortMapping: YardPortMapping,
  ): Promise<YardPortMapping> {
    return this.yardPortMappingRepository.create(yardPortMapping);
  }

  @get('/yard-port-mappings/count', {
    responses: {
      '200': {
        description: 'YardPortMapping model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(YardPortMapping) where?: Where<YardPortMapping>,
  ): Promise<Count> {
    return this.yardPortMappingRepository.count(where);
  }

  @get('/yard-port-mappings', {
    responses: {
      '200': {
        description: 'Array of YardPortMapping model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(YardPortMapping, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(YardPortMapping) filter?: Filter<YardPortMapping>,
  ): Promise<YardPortMapping[]> {
    return this.yardPortMappingRepository.find(filter);
  }

  @patch('/yard-port-mappings', {
    responses: {
      '200': {
        description: 'YardPortMapping PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardPortMapping, {partial: true}),
        },
      },
    })
    yardPortMapping: YardPortMapping,
    @param.where(YardPortMapping) where?: Where<YardPortMapping>,
  ): Promise<Count> {
    return this.yardPortMappingRepository.updateAll(yardPortMapping, where);
  }

  @get('/yard-port-mappings/{id}', {
    responses: {
      '200': {
        description: 'YardPortMapping model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(YardPortMapping, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(YardPortMapping, {exclude: 'where'}) filter?: FilterExcludingWhere<YardPortMapping>
  ): Promise<YardPortMapping> {
    return this.yardPortMappingRepository.findById(id, filter);
  }

  @patch('/yard-port-mappings/{id}', {
    responses: {
      '204': {
        description: 'YardPortMapping PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardPortMapping, {partial: true}),
        },
      },
    })
    yardPortMapping: YardPortMapping,
  ): Promise<void> {
    await this.yardPortMappingRepository.updateById(id, yardPortMapping);
  }

  @put('/yard-port-mappings/{id}', {
    responses: {
      '204': {
        description: 'YardPortMapping PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() yardPortMapping: YardPortMapping,
  ): Promise<void> {
    await this.yardPortMappingRepository.replaceById(id, yardPortMapping);
  }

  @del('/yard-port-mappings/{id}', {
    responses: {
      '204': {
        description: 'YardPortMapping DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.yardPortMappingRepository.deleteById(id);
  }
}
