import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {WeightMaster} from '../models';
import {WeightMasterRepository} from '../repositories';

export class WeightMasterController {
  constructor(
    @repository(WeightMasterRepository)
    public weightMasterRepository : WeightMasterRepository,
  ) {}

  @post('/weight-masters', {
    responses: {
      '200': {
        description: 'WeightMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(WeightMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(WeightMaster, {
            title: 'NewWeightMaster',

          }),
        },
      },
    })
    weightMaster: WeightMaster,
  ): Promise<WeightMaster> {
    return this.weightMasterRepository.create(weightMaster);
  }

  @get('/weight-masters/count', {
    responses: {
      '200': {
        description: 'WeightMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(WeightMaster) where?: Where<WeightMaster>,
  ): Promise<Count> {
    return this.weightMasterRepository.count(where);
  }

  @get('/weight-masters', {
    responses: {
      '200': {
        description: 'Array of WeightMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(WeightMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(WeightMaster) filter?: Filter<WeightMaster>,
  ): Promise<WeightMaster[]> {
    return this.weightMasterRepository.find(filter);
  }

  @patch('/weight-masters', {
    responses: {
      '200': {
        description: 'WeightMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(WeightMaster, {partial: true}),
        },
      },
    })
    weightMaster: WeightMaster,
    @param.where(WeightMaster) where?: Where<WeightMaster>,
  ): Promise<Count> {
    return this.weightMasterRepository.updateAll(weightMaster, where);
  }

  @get('/weight-masters/{id}', {
    responses: {
      '200': {
        description: 'WeightMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(WeightMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(WeightMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<WeightMaster>
  ): Promise<WeightMaster> {
    return this.weightMasterRepository.findById(id, filter);
  }

  @patch('/weight-masters/{id}', {
    responses: {
      '204': {
        description: 'WeightMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(WeightMaster, {partial: true}),
        },
      },
    })
    weightMaster: WeightMaster,
  ): Promise<void> {
    await this.weightMasterRepository.updateById(id, weightMaster);
  }

  @put('/weight-masters/{id}', {
    responses: {
      '204': {
        description: 'WeightMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() weightMaster: WeightMaster,
  ): Promise<void> {
    await this.weightMasterRepository.replaceById(id, weightMaster);
  }

  @del('/weight-masters/{id}', {
    responses: {
      '204': {
        description: 'WeightMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.weightMasterRepository.deleteById(id);
  }
}
