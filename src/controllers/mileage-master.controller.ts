import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {MileageMaster} from '../models';
import {MileageMasterRepository} from '../repositories';

export class MileageMasterController {
  constructor(
    @repository(MileageMasterRepository)
    public mileageMasterRepository: MileageMasterRepository,
  ) {}

  @post('/mileage-masters', {
    responses: {
      '200': {
        description: 'MileageMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(MileageMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MileageMaster, {
            title: 'NewMileageMaster',

          }),
        },
      },
    })
    mileageMaster: MileageMaster,
  ): Promise<MileageMaster> {
    return this.mileageMasterRepository.create(mileageMaster);
  }

  @get('/mileage-masters/count', {
    responses: {
      '200': {
        description: 'MileageMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(MileageMaster) where?: Where<MileageMaster>,
  ): Promise<Count> {
    return this.mileageMasterRepository.count(where);
  }

  @get('/mileage-masters', {
    responses: {
      '200': {
        description: 'Array of MileageMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(MileageMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(MileageMaster) filter?: Filter<MileageMaster>,
  ): Promise<MileageMaster[]> {
    return this.mileageMasterRepository.find(filter);
  }

  @patch('/mileage-masters', {
    responses: {
      '200': {
        description: 'MileageMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MileageMaster, {partial: true}),
        },
      },
    })
    mileageMaster: MileageMaster,
    @param.where(MileageMaster) where?: Where<MileageMaster>,
  ): Promise<Count> {
    return this.mileageMasterRepository.updateAll(mileageMaster, where);
  }

  @get('/mileage-masters/{id}', {
    responses: {
      '200': {
        description: 'MileageMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(MileageMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(MileageMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<MileageMaster>
  ): Promise<MileageMaster> {
    return this.mileageMasterRepository.findById(id, filter);
  }

  @patch('/mileage-masters/{id}', {
    responses: {
      '204': {
        description: 'MileageMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MileageMaster, {partial: true}),
        },
      },
    })
    mileageMaster: MileageMaster,
  ): Promise<void> {
    await this.mileageMasterRepository.updateById(id, mileageMaster);
  }

  @put('/mileage-masters/{id}', {
    responses: {
      '204': {
        description: 'MileageMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() mileageMaster: MileageMaster,
  ): Promise<void> {
    await this.mileageMasterRepository.replaceById(id, mileageMaster);
  }

  @del('/mileage-masters/{id}', {
    responses: {
      '204': {
        description: 'MileageMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.mileageMasterRepository.deleteById(id);
  }
}
