import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {ContainerMaster} from '../models';
import {ContainerMasterRepository} from '../repositories';


export class ContainerMasterController {
  constructor(
    @repository(ContainerMasterRepository)
    public containerMasterRepository: ContainerMasterRepository,
  ) {}

  @post('/container-masters', {
    responses: {
      '200': {
        description: 'ContainerMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(ContainerMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ContainerMaster, {
            title: 'NewContainerMaster',

          }),
        },
      },
    })
    containerMaster: ContainerMaster,
  ): Promise<ContainerMaster> {
    return this.containerMasterRepository.create(containerMaster);
  }

  @get('/container-masters/count', {
    responses: {
      '200': {
        description: 'ContainerMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(ContainerMaster) where?: Where<ContainerMaster>,
  ): Promise<Count> {
    return this.containerMasterRepository.count(where);
  }

  @get('/container-masters', {
    responses: {
      '200': {
        description: 'Array of ContainerMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(ContainerMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(ContainerMaster) filter?: Filter<ContainerMaster>,
  ): Promise<ContainerMaster[]> {
    return this.containerMasterRepository.find(filter);
  }

  @patch('/container-masters', {
    responses: {
      '200': {
        description: 'ContainerMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ContainerMaster, {partial: true}),
        },
      },
    })
    containerMaster: ContainerMaster,
    @param.where(ContainerMaster) where?: Where<ContainerMaster>,
  ): Promise<Count> {
    return this.containerMasterRepository.updateAll(containerMaster, where);
  }

  @get('/container-masters/{id}', {
    responses: {
      '200': {
        description: 'ContainerMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(ContainerMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(ContainerMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<ContainerMaster>
  ): Promise<ContainerMaster> {
    return this.containerMasterRepository.findById(id, filter);
  }

  @patch('/container-masters/{id}', {
    responses: {
      '204': {
        description: 'ContainerMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ContainerMaster, {partial: true}),
        },
      },
    })
    containerMaster: ContainerMaster,
  ): Promise<void> {
    await this.containerMasterRepository.updateById(id, containerMaster);
  }

  @put('/container-masters/{id}', {
    responses: {
      '204': {
        description: 'ContainerMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() containerMaster: ContainerMaster,
  ): Promise<void> {
    await this.containerMasterRepository.replaceById(id, containerMaster);
  }

  @del('/container-masters/{id}', {
    responses: {
      '204': {
        description: 'ContainerMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.containerMasterRepository.deleteById(id);
  }
}
