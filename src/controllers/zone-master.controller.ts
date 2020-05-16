import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {ZoneMaster} from '../models';
import {ZoneMasterRepository} from '../repositories';

export class ZoneMasterController {
  constructor(
    @repository(ZoneMasterRepository)
    public zoneMasterRepository: ZoneMasterRepository,
  ) {}

  @post('/zone-masters', {
    responses: {
      '200': {
        description: 'ZoneMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(ZoneMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ZoneMaster, {
            title: 'NewZoneMaster',

          }),
        },
      },
    })
    zoneMaster: ZoneMaster,
  ): Promise<ZoneMaster> {
    return this.zoneMasterRepository.create(zoneMaster);
  }

  @get('/zone-masters/count', {
    responses: {
      '200': {
        description: 'ZoneMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(ZoneMaster) where?: Where<ZoneMaster>,
  ): Promise<Count> {
    return this.zoneMasterRepository.count(where);
  }

  @get('/zone-masters', {
    responses: {
      '200': {
        description: 'Array of ZoneMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(ZoneMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(ZoneMaster) filter?: Filter<ZoneMaster>,
  ): Promise<ZoneMaster[]> {
    return this.zoneMasterRepository.find(filter);
  }

  @patch('/zone-masters', {
    responses: {
      '200': {
        description: 'ZoneMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ZoneMaster, {partial: true}),
        },
      },
    })
    zoneMaster: ZoneMaster,
    @param.where(ZoneMaster) where?: Where<ZoneMaster>,
  ): Promise<Count> {
    return this.zoneMasterRepository.updateAll(zoneMaster, where);
  }

  @get('/zone-masters/{id}', {
    responses: {
      '200': {
        description: 'ZoneMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(ZoneMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(ZoneMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<ZoneMaster>
  ): Promise<ZoneMaster> {
    return this.zoneMasterRepository.findById(id, filter);
  }

  @patch('/zone-masters/{id}', {
    responses: {
      '204': {
        description: 'ZoneMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ZoneMaster, {partial: true}),
        },
      },
    })
    zoneMaster: ZoneMaster,
  ): Promise<void> {
    await this.zoneMasterRepository.updateById(id, zoneMaster);
  }

  @put('/zone-masters/{id}', {
    responses: {
      '204': {
        description: 'ZoneMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() zoneMaster: ZoneMaster,
  ): Promise<void> {
    await this.zoneMasterRepository.replaceById(id, zoneMaster);
  }

  @del('/zone-masters/{id}', {
    responses: {
      '204': {
        description: 'ZoneMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.zoneMasterRepository.deleteById(id);
  }
}
