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
import {YardMaster} from '../models';
import {YardMasterRepository} from '../repositories';
@authenticate('jwt')
export class YardMasterController {
  constructor(
    @repository(YardMasterRepository)
    public yardMasterRepository : YardMasterRepository,
  ) {}

  @post('/yard-masters', {
    responses: {
      '200': {
        description: 'YardMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(YardMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardMaster, {
            title: 'NewYardMaster',
            exclude: ['yardMasterId'],
          }),
        },
      },
    })
    yardMaster: Omit<YardMaster, 'yardMasterId'>,
  ): Promise<YardMaster> {
    return this.yardMasterRepository.create(yardMaster);
  }

  @get('/yard-masters/count', {
    responses: {
      '200': {
        description: 'YardMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(YardMaster) where?: Where<YardMaster>,
  ): Promise<Count> {
    return this.yardMasterRepository.count(where);
  }

  @get('/yard-masters', {
    responses: {
      '200': {
        description: 'Array of YardMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(YardMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    // @param.filter(YardMaster) filter?: Filter<YardMaster>,
    @param.filter(YardMaster) filter: Filter<YardMaster> = {where : {isActive: true}},
  ): Promise<YardMaster[]> {
    return this.yardMasterRepository.find(filter);
  }

  @patch('/yard-masters', {
    responses: {
      '200': {
        description: 'YardMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardMaster, {partial: true}),
        },
      },
    })
    yardMaster: YardMaster,
    @param.where(YardMaster) where?: Where<YardMaster>,
  ): Promise<Count> {
    return this.yardMasterRepository.updateAll(yardMaster, where);
  }

  @get('/yard-masters/{id}', {
    responses: {
      '200': {
        description: 'YardMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(YardMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(YardMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<YardMaster>
  ): Promise<YardMaster> {
    return this.yardMasterRepository.findById(id, filter);
  }

  @patch('/yard-masters/{id}', {
    responses: {
      '204': {
        description: 'YardMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(YardMaster, {partial: true}),
        },
      },
    })
    yardMaster: YardMaster,
  ): Promise<void> {
    await this.yardMasterRepository.updateById(id, yardMaster);
  }

  @put('/yard-masters/{id}', {
    responses: {
      '204': {
        description: 'YardMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() yardMaster: YardMaster,
  ): Promise<void> {
    await this.yardMasterRepository.replaceById(id, yardMaster);
  }

  @del('/yard-masters/{id}', {
    responses: {
      '204': {
        description: 'YardMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.yardMasterRepository.deleteById(id);
  }
}
