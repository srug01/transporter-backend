import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody,
} from '@loopback/rest';
import {LocationMaster, StateMaster} from '../models';
import {StateMasterRepository} from '../repositories';

export class StateMasterLocationMasterController {
  constructor(
    @repository(StateMasterRepository)
    protected stateMasterRepository: StateMasterRepository,
  ) {}

  @get('/state-masters/{id}/location-masters', {
    responses: {
      '200': {
        description: 'Array of StateMaster has many LocationMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(LocationMaster)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<LocationMaster>,
  ): Promise<LocationMaster[]> {
    return this.stateMasterRepository.locationMasters(id).find(filter);
  }

  @post('/state-masters/{id}/location-masters', {
    responses: {
      '200': {
        description: 'StateMaster model instance',
        content: {
          'application/json': {schema: getModelSchemaRef(LocationMaster)},
        },
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof StateMaster.prototype.stateMasterId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(LocationMaster, {
            title: 'NewLocationMasterInStateMaster',
            exclude: ['locationMasterId'],
            optional: ['stateMasterId'],
          }),
        },
      },
    })
    locationMaster: Omit<LocationMaster, 'locationMasterId'>,
  ): Promise<LocationMaster> {
    return this.stateMasterRepository
      .locationMasters(id)
      .create(locationMaster);
  }

  @patch('/state-masters/{id}/location-masters', {
    responses: {
      '200': {
        description: 'StateMaster.LocationMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(LocationMaster, {partial: true}),
        },
      },
    })
    locationMaster: Partial<LocationMaster>,
    @param.query.object('where', getWhereSchemaFor(LocationMaster))
    where?: Where<LocationMaster>,
  ): Promise<Count> {
    return this.stateMasterRepository
      .locationMasters(id)
      .patch(locationMaster, where);
  }

  @del('/state-masters/{id}/location-masters', {
    responses: {
      '200': {
        description: 'StateMaster.LocationMaster DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(LocationMaster))
    where?: Where<LocationMaster>,
  ): Promise<Count> {
    return this.stateMasterRepository.locationMasters(id).delete(where);
  }
}
