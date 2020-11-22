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
import {Paymenthistory} from '../models';
import {PaymenthistoryRepository} from '../repositories';

export class PaymenthistoryController {
  constructor(
    @repository(PaymenthistoryRepository)
    public paymenthistoryRepository : PaymenthistoryRepository,
  ) {}

  @post('/paymenthistories', {
    responses: {
      '200': {
        description: 'Paymenthistory model instance',
        content: {'application/json': {schema: getModelSchemaRef(Paymenthistory)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymenthistory, {
            title: 'NewPaymenthistory',
            exclude: ['paymenthistoryId'],
          }),
        },
      },
    })
    paymenthistory: Omit<Paymenthistory, 'paymenthistoryId'>,
  ): Promise<Paymenthistory> {
    return this.paymenthistoryRepository.create(paymenthistory);
  }

  @get('/paymenthistories/count', {
    responses: {
      '200': {
        description: 'Paymenthistory model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Paymenthistory) where?: Where<Paymenthistory>,
  ): Promise<Count> {
    return this.paymenthistoryRepository.count(where);
  }

  @get('/paymenthistories', {
    responses: {
      '200': {
        description: 'Array of Paymenthistory model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Paymenthistory, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Paymenthistory) filter?: Filter<Paymenthistory>,
  ): Promise<Paymenthistory[]> {
    return this.paymenthistoryRepository.find(filter);
  }

  @patch('/paymenthistories', {
    responses: {
      '200': {
        description: 'Paymenthistory PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymenthistory, {partial: true}),
        },
      },
    })
    paymenthistory: Paymenthistory,
    @param.where(Paymenthistory) where?: Where<Paymenthistory>,
  ): Promise<Count> {
    return this.paymenthistoryRepository.updateAll(paymenthistory, where);
  }

  @get('/paymenthistories/{id}', {
    responses: {
      '200': {
        description: 'Paymenthistory model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Paymenthistory, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Paymenthistory, {exclude: 'where'}) filter?: FilterExcludingWhere<Paymenthistory>
  ): Promise<Paymenthistory> {
    return this.paymenthistoryRepository.findById(id, filter);
  }

  @patch('/paymenthistories/{id}', {
    responses: {
      '204': {
        description: 'Paymenthistory PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Paymenthistory, {partial: true}),
        },
      },
    })
    paymenthistory: Paymenthistory,
  ): Promise<void> {
    await this.paymenthistoryRepository.updateById(id, paymenthistory);
  }

  @put('/paymenthistories/{id}', {
    responses: {
      '204': {
        description: 'Paymenthistory PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() paymenthistory: Paymenthistory,
  ): Promise<void> {
    await this.paymenthistoryRepository.replaceById(id, paymenthistory);
  }

  @del('/paymenthistories/{id}', {
    responses: {
      '204': {
        description: 'Paymenthistory DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.paymenthistoryRepository.deleteById(id);
  }
}
