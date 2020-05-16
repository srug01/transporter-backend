import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {CfsRateMaster} from '../models';
import {CfsRateMasterRepository} from '../repositories';

export class CfsRateMasterController {
  constructor(
    @repository(CfsRateMasterRepository)
    public cfsRateMasterRepository : CfsRateMasterRepository,
  ) {}

  @post('/cfs-rate-masters', {
    responses: {
      '200': {
        description: 'CfsRateMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(CfsRateMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsRateMaster, {
            title: 'NewCfsRateMaster',

          }),
        },
      },
    })
    cfsRateMaster: CfsRateMaster,
  ): Promise<CfsRateMaster> {
    return this.cfsRateMasterRepository.create(cfsRateMaster);
  }

  @get('/cfs-rate-masters/count', {
    responses: {
      '200': {
        description: 'CfsRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(CfsRateMaster) where?: Where<CfsRateMaster>,
  ): Promise<Count> {
    return this.cfsRateMasterRepository.count(where);
  }

  @get('/cfs-rate-masters', {
    responses: {
      '200': {
        description: 'Array of CfsRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(CfsRateMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(CfsRateMaster) filter?: Filter<CfsRateMaster>,
  ): Promise<CfsRateMaster[]> {
    return this.cfsRateMasterRepository.find(filter);
  }

  @patch('/cfs-rate-masters', {
    responses: {
      '200': {
        description: 'CfsRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsRateMaster, {partial: true}),
        },
      },
    })
    cfsRateMaster: CfsRateMaster,
    @param.where(CfsRateMaster) where?: Where<CfsRateMaster>,
  ): Promise<Count> {
    return this.cfsRateMasterRepository.updateAll(cfsRateMaster, where);
  }

  @get('/cfs-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'CfsRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CfsRateMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CfsRateMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<CfsRateMaster>
  ): Promise<CfsRateMaster> {
    return this.cfsRateMasterRepository.findById(id, filter);
  }

  @patch('/cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsRateMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsRateMaster, {partial: true}),
        },
      },
    })
    cfsRateMaster: CfsRateMaster,
  ): Promise<void> {
    await this.cfsRateMasterRepository.updateById(id, cfsRateMaster);
  }

  @put('/cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsRateMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() cfsRateMaster: CfsRateMaster,
  ): Promise<void> {
    await this.cfsRateMasterRepository.replaceById(id, cfsRateMaster);
  }

  @del('/cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'CfsRateMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.cfsRateMasterRepository.deleteById(id);
  }
}
