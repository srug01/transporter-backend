import {authenticate} from '@loopback/authentication';
import {Count, CountSchema, Filter, FilterExcludingWhere, repository, Where} from '@loopback/repository';
import {del, get, getModelSchemaRef, param, patch, post, put, requestBody} from '@loopback/rest';
import {ZoneDayMaster} from '../models';
import {ZoneDayMasterRepository} from '../repositories';

export class ZoneDayMasterController {
  constructor(
    @repository(ZoneDayMasterRepository)
    public zoneDayMasterRepository: ZoneDayMasterRepository,
  ) {}

  @post('/zone-day-masters', {
    responses: {
      '200': {
        description: 'ZoneDayMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(ZoneDayMaster)}},
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ZoneDayMaster, {
            title: 'NewZoneDayMaster',

          }),
        },
      },
    })
    zoneDayMaster: ZoneDayMaster,
  ): Promise<ZoneDayMaster> {
    return this.zoneDayMasterRepository.create(zoneDayMaster);
  }

  @get('/zone-day-masters/count', {
    responses: {
      '200': {
        description: 'ZoneDayMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(ZoneDayMaster) where?: Where<ZoneDayMaster>,
  ): Promise<Count> {
    return this.zoneDayMasterRepository.count(where);
  }

  @get('/zone-day-masters', {
    responses: {
      '200': {
        description: 'Array of ZoneDayMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(ZoneDayMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(ZoneDayMaster) filter?: Filter<ZoneDayMaster>,
  ): Promise<ZoneDayMaster[]> {
    return this.zoneDayMasterRepository.find(filter);
  }

  @patch('/zone-day-masters', {
    responses: {
      '200': {
        description: 'ZoneDayMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ZoneDayMaster, {partial: true}),
        },
      },
    })
    zoneDayMaster: ZoneDayMaster,
    @param.where(ZoneDayMaster) where?: Where<ZoneDayMaster>,
  ): Promise<Count> {
    return this.zoneDayMasterRepository.updateAll(zoneDayMaster, where);
  }

  @get('/zone-day-masters/{id}', {
    responses: {
      '200': {
        description: 'ZoneDayMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(ZoneDayMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(ZoneDayMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<ZoneDayMaster>
  ): Promise<ZoneDayMaster> {
    return this.zoneDayMasterRepository.findById(id, filter);
  }

  @patch('/zone-day-masters/{id}', {
    responses: {
      '204': {
        description: 'ZoneDayMaster PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ZoneDayMaster, {partial: true}),
        },
      },
    })
    zoneDayMaster: ZoneDayMaster,
  ): Promise<void> {
    await this.zoneDayMasterRepository.updateById(id, zoneDayMaster);
  }

  @put('/zone-day-masters/{id}', {
    responses: {
      '204': {
        description: 'ZoneDayMaster PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() zoneDayMaster: ZoneDayMaster,
  ): Promise<void> {
    await this.zoneDayMasterRepository.replaceById(id, zoneDayMaster);
  }

  @del('/zone-day-masters/{id}', {
    responses: {
      '204': {
        description: 'ZoneDayMaster DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.zoneDayMasterRepository.deleteById(id);
  }
}
