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
import {Bid} from '../models';
import {BidRepository} from '../repositories';

export class BidController {
  constructor(
    @repository(BidRepository)
    public bidRepository : BidRepository,
  ) {}

  @post('/bids', {
    responses: {
      '200': {
        description: 'Bid model instance',
        content: {'application/json': {schema: getModelSchemaRef(Bid)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Bid, {
            title: 'NewBid',
            exclude: ['bidId'],
          }),
        },
      },
    })
    bid: Omit<Bid, 'bidId'>,
  ): Promise<Bid> {
    return this.bidRepository.create(bid);
  }

  @get('/bids/count', {
    responses: {
      '200': {
        description: 'Bid model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Bid) where?: Where<Bid>,
  ): Promise<Count> {
    return this.bidRepository.count(where);
  }

  @get('/bids', {
    responses: {
      '200': {
        description: 'Array of Bid model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Bid, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Bid) filter?: Filter<Bid>,
  ): Promise<Bid[]> {
    return this.bidRepository.find(filter);
  }

  @patch('/bids', {
    responses: {
      '200': {
        description: 'Bid PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Bid, {partial: true}),
        },
      },
    })
    bid: Bid,
    @param.where(Bid) where?: Where<Bid>,
  ): Promise<Count> {
    return this.bidRepository.updateAll(bid, where);
  }

  @get('/bids/{id}', {
    responses: {
      '200': {
        description: 'Bid model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Bid, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Bid, {exclude: 'where'}) filter?: FilterExcludingWhere<Bid>
  ): Promise<Bid> {
    return this.bidRepository.findById(id, filter);
  }

  @patch('/bids/{id}', {
    responses: {
      '204': {
        description: 'Bid PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Bid, {partial: true}),
        },
      },
    })
    bid: Bid,
  ): Promise<void> {
    await this.bidRepository.updateById(id, bid);
  }

  @put('/bids/{id}', {
    responses: {
      '204': {
        description: 'Bid PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() bid: Bid,
  ): Promise<void> {
    await this.bidRepository.replaceById(id, bid);
  }

  @del('/bids/{id}', {
    responses: {
      '204': {
        description: 'Bid DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.bidRepository.deleteById(id);
  }
}
