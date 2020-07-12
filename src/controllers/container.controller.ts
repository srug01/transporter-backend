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
import {Container} from '../models';
import {ContainerRepository} from '../repositories';

export class ContainerController {
  constructor(
    @repository(ContainerRepository)
    public containerRepository : ContainerRepository,
  ) {}

  @post('/containers', {
    responses: {
      '200': {
        description: 'Container model instance',
        content: {'application/json': {schema: getModelSchemaRef(Container)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Container, {
            title: 'NewContainer',
            exclude: ['containerId'],
          }),
        },
      },
    })
    container: Omit<Container, 'containerId'>,
  ): Promise<Container> {
    return this.containerRepository.create(container);
  }

  @get('/containers/count', {
    responses: {
      '200': {
        description: 'Container model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Container) where?: Where<Container>,
  ): Promise<Count> {
    return this.containerRepository.count(where);
  }

  @get('/containers', {
    responses: {
      '200': {
        description: 'Array of Container model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Container, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Container) filter?: Filter<Container>,
  ): Promise<Container[]> {
    return this.containerRepository.find(filter);
  }

  @patch('/containers', {
    responses: {
      '200': {
        description: 'Container PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Container, {partial: true}),
        },
      },
    })
    container: Container,
    @param.where(Container) where?: Where<Container>,
  ): Promise<Count> {
    return this.containerRepository.updateAll(container, where);
  }

  @get('/containers/{id}', {
    responses: {
      '200': {
        description: 'Container model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Container, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Container, {exclude: 'where'}) filter?: FilterExcludingWhere<Container>
  ): Promise<Container> {
    return this.containerRepository.findById(id, filter);
  }

  @patch('/containers/{id}', {
    responses: {
      '204': {
        description: 'Container PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Container, {partial: true}),
        },
      },
    })
    container: Container,
  ): Promise<void> {
    await this.containerRepository.updateById(id, container);
  }

  @put('/containers/{id}', {
    responses: {
      '204': {
        description: 'Container PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() container: Container,
  ): Promise<void> {
    await this.containerRepository.replaceById(id, container);
  }

  @del('/containers/{id}', {
    responses: {
      '204': {
        description: 'Container DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.containerRepository.deleteById(id);
  }
}
