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
import {Timeslotmaster} from '../models';
import {TimeslotmasterRepository} from '../repositories';

export class TimeslotmasterController {
  constructor(
    @repository(TimeslotmasterRepository)
    public timeslotmasterRepository : TimeslotmasterRepository,
  ) {}

  @post('/timeslotmasters', {
    responses: {
      '200': {
        description: 'Timeslotmaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(Timeslotmaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Timeslotmaster, {
            title: 'NewTimeslotmaster',
            exclude: ['timeslotMasterId'],
          }),
        },
      },
    })
    timeslotmaster: Omit<Timeslotmaster, 'timeslotMasterId'>,
  ): Promise<Timeslotmaster> {
    return this.timeslotmasterRepository.create(timeslotmaster);
  }

  @get('/timeslotmasters/count', {
    responses: {
      '200': {
        description: 'Timeslotmaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Timeslotmaster) where?: Where<Timeslotmaster>,
  ): Promise<Count> {
    return this.timeslotmasterRepository.count(where);
  }

  @get('/timeslotmasters', {
    responses: {
      '200': {
        description: 'Array of Timeslotmaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Timeslotmaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Timeslotmaster) filter?: Filter<Timeslotmaster>,
  ): Promise<Timeslotmaster[]> {
    return this.timeslotmasterRepository.find(filter);
  }

  @patch('/timeslotmasters', {
    responses: {
      '200': {
        description: 'Timeslotmaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Timeslotmaster, {partial: true}),
        },
      },
    })
    timeslotmaster: Timeslotmaster,
    @param.where(Timeslotmaster) where?: Where<Timeslotmaster>,
  ): Promise<Count> {
    return this.timeslotmasterRepository.updateAll(timeslotmaster, where);
  }

  @get('/timeslotmasters/{id}', {
    responses: {
      '200': {
        description: 'Timeslotmaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Timeslotmaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Timeslotmaster, {exclude: 'where'}) filter?: FilterExcludingWhere<Timeslotmaster>
  ): Promise<Timeslotmaster> {
    return this.timeslotmasterRepository.findById(id, filter);
  }

  @patch('/timeslotmasters/{id}', {
    responses: {
      '204': {
        description: 'Timeslotmaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Timeslotmaster, {partial: true}),
        },
      },
    })
    timeslotmaster: Timeslotmaster,
  ): Promise<void> {
    await this.timeslotmasterRepository.updateById(id, timeslotmaster);
  }

  @put('/timeslotmasters/{id}', {
    responses: {
      '204': {
        description: 'Timeslotmaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() timeslotmaster: Timeslotmaster,
  ): Promise<void> {
    await this.timeslotmasterRepository.replaceById(id, timeslotmaster);
  }

  @del('/timeslotmasters/{id}', {
    responses: {
      '204': {
        description: 'Timeslotmaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.timeslotmasterRepository.deleteById(id);
  }
}
