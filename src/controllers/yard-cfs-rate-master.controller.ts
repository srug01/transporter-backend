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
import {YardCfsRateMaster} from '../models';
import {YardCfsRateMasterRepository} from '../repositories';

export class YardCfsRateMasterController {
  constructor(
    @repository(YardCfsRateMasterRepository)
    public yardCfsRateMasterRepository : YardCfsRateMasterRepository,
  ) {}

  @post('/yard-cfs-rate-masters', {
    responses: {
      '200': {
        description: 'YardCfsRateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(YardCfsRateMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardCfsRateMaster, {
            title: 'NewYardCfsRateMaster',
            exclude: ['yardCfsRateMasterId'],
          }),
        },
      },
    })
    yardCfsRateMaster: Omit<YardCfsRateMaster, 'yardCfsRateMasterId'>,
  ): Promise<YardCfsRateMaster> {
    return this.yardCfsRateMasterRepository.create(yardCfsRateMaster);
  }

  @get('/yard-cfs-rate-masters/count', {
    responses: {
      '200': {
        description: 'YardCfsRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(YardCfsRateMaster) where?: Where<YardCfsRateMaster>,
  ): Promise<Count> {
    return this.yardCfsRateMasterRepository.count(where);
  }

  @get('/yard-cfs-rate-masters', {
    responses: {
      '200': {
        description: 'Array of YardCfsRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(YardCfsRateMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(YardCfsRateMaster) filter?: Filter<YardCfsRateMaster>,
  ): Promise<YardCfsRateMaster[]> {
    return this.yardCfsRateMasterRepository.find(filter);
  }

  @patch('/yard-cfs-rate-masters', {
    responses: {
      '200': {
        description: 'YardCfsRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardCfsRateMaster, {partial: true}),
        },
      },
    })
    yardCfsRateMaster: YardCfsRateMaster,
    @param.where(YardCfsRateMaster) where?: Where<YardCfsRateMaster>,
  ): Promise<Count> {
    return this.yardCfsRateMasterRepository.updateAll(yardCfsRateMaster, where);
  }

  @get('/yard-cfs-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'YardCfsRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(YardCfsRateMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(YardCfsRateMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<YardCfsRateMaster>
  ): Promise<YardCfsRateMaster> {
    return this.yardCfsRateMasterRepository.findById(id, filter);
  }

  @patch('/yard-cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'YardCfsRateMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardCfsRateMaster, {partial: true}),
        },
      },
    })
    yardCfsRateMaster: YardCfsRateMaster,
  ): Promise<void> {
    await this.yardCfsRateMasterRepository.updateById(id, yardCfsRateMaster);
  }

  @put('/yard-cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'YardCfsRateMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() yardCfsRateMaster: YardCfsRateMaster,
  ): Promise<void> {
    await this.yardCfsRateMasterRepository.replaceById(id, yardCfsRateMaster);
  }

  @del('/yard-cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'YardCfsRateMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.yardCfsRateMasterRepository.deleteById(id);
  }
}
