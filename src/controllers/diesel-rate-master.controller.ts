import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {DieselRateMaster} from '../models';
import {DieselRateMasterRepository} from '../repositories';


export class DieselRateMasterController {
  constructor(
    @repository(DieselRateMasterRepository)
    public dieselRateMasterRepository: DieselRateMasterRepository,
  ) {}

  @post('/diesel-rate-masters', {
    responses: {
      '200': {
        description: 'DieselRateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(DieselRateMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DieselRateMaster, {
            title: 'NewDieselRateMaster',

          }),
        },
      },
    })
    dieselRateMaster: DieselRateMaster,
  ): Promise<DieselRateMaster> {
    return this.dieselRateMasterRepository.create(dieselRateMaster);
  }

  @get('/diesel-rate-masters/count', {
    responses: {
      '200': {
        description: 'DieselRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(DieselRateMaster) where?: Where<DieselRateMaster>,
  ): Promise<Count> {
    return this.dieselRateMasterRepository.count(where);
  }

  @get('/diesel-rate-masters', {
    responses: {
      '200': {
        description: 'Array of DieselRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(DieselRateMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(DieselRateMaster) filter?: Filter<DieselRateMaster>,
  ): Promise<DieselRateMaster[]> {
    return this.dieselRateMasterRepository.find(filter);
  }

  @patch('/diesel-rate-masters', {
    responses: {
      '200': {
        description: 'DieselRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DieselRateMaster, {partial: true}),
        },
      },
    })
    dieselRateMaster: DieselRateMaster,
    @param.where(DieselRateMaster) where?: Where<DieselRateMaster>,
  ): Promise<Count> {
    return this.dieselRateMasterRepository.updateAll(dieselRateMaster, where);
  }

  @get('/diesel-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'DieselRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(DieselRateMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(DieselRateMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<DieselRateMaster>
  ): Promise<DieselRateMaster> {
    return this.dieselRateMasterRepository.findById(id, filter);
  }

  @patch('/diesel-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'DieselRateMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(DieselRateMaster, {partial: true}),
        },
      },
    })
    dieselRateMaster: DieselRateMaster,
  ): Promise<void> {
    await this.dieselRateMasterRepository.updateById(id, dieselRateMaster);
  }

  @put('/diesel-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'DieselRateMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() dieselRateMaster: DieselRateMaster,
  ): Promise<void> {
    await this.dieselRateMasterRepository.replaceById(id, dieselRateMaster);
  }

  @del('/diesel-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'DieselRateMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.dieselRateMasterRepository.deleteById(id);
  }
}
