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
  del,
  get,
  getModelSchemaRef,
  param,
  patch,
  post,
  put,
  requestBody
} from '@loopback/rest';
import {Trip} from '../models';
import {TripRepository} from '../repositories';
@authenticate('jwt')
export class TripController {
  constructor(
    @repository(TripRepository)
    public tripRepository: TripRepository,
  ) {}

  @post('/trips', {
    responses: {
      '200': {
        description: 'Trip model instance',
        content: {'application/json': {schema: getModelSchemaRef(Trip)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Trip, {
            title: 'NewTrip',
            exclude: ['tripId'],
          }),
        },
      },
    })
    trip: Omit<Trip, 'tripId'>,
  ): Promise<Trip> {
    return this.tripRepository.create(trip);
  }

  @get('/trips/count', {
    responses: {
      '200': {
        description: 'Trip model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(@param.where(Trip) where?: Where<Trip>): Promise<Count> {
    return this.tripRepository.count(where);
  }

  @get('/trips', {
    responses: {
      '200': {
        description: 'Array of Trip model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Trip, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(@param.filter(Trip) filter?: Filter<Trip>): Promise<Trip[]> {
    return this.tripRepository.find(filter);
  }

  @patch('/trips', {
    responses: {
      '200': {
        description: 'Trip PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Trip, {partial: true}),
        },
      },
    })
    trip: Trip,
    @param.where(Trip) where?: Where<Trip>,
  ): Promise<Count> {
    return this.tripRepository.updateAll(trip, where);
  }

  @get('/trips/{id}', {
    responses: {
      '200': {
        description: 'Trip model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Trip, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Trip, {exclude: 'where'}) filter?: FilterExcludingWhere<Trip>,
  ): Promise<Trip> {
    return this.tripRepository.findById(id, filter);
  }

  @patch('/trips/{id}', {
    responses: {
      '204': {
        description: 'Trip PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Trip, {partial: true}),
        },
      },
    })
    trip: Trip,
  ): Promise<void> {
    console.log(trip.startDate?.toString());
    await this.tripRepository.updateById(id, trip);
  }

  @put('/trips/{id}', {
    responses: {
      '204': {
        description: 'Trip PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() trip: Trip,
  ): Promise<void> {
    await this.tripRepository.replaceById(id, trip);
  }

  @del('/trips/{id}', {
    responses: {
      '204': {
        description: 'Trip DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.tripRepository.deleteById(id);
  }
}
