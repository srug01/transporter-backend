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
import {TransporterInvoice} from '../models';
import {TransporterInvoiceRepository} from '../repositories';

export class TransporterInvoiceController {
  constructor(
    @repository(TransporterInvoiceRepository)
    public transporterInvoiceRepository : TransporterInvoiceRepository,
  ) {}

  @post('/transporter-invoices', {
    responses: {
      '200': {
        description: 'TransporterInvoice model instance',
        content: {'application/json': {schema: getModelSchemaRef(TransporterInvoice)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TransporterInvoice, {
            title: 'NewTransporterInvoice',
            exclude: ['transporterInvoiceId'],
          }),
        },
      },
    })
    transporterInvoice: Omit<TransporterInvoice, 'transporterInvoiceId'>,
  ): Promise<TransporterInvoice> {
    return this.transporterInvoiceRepository.create(transporterInvoice);
  }

  @get('/transporter-invoices/count', {
    responses: {
      '200': {
        description: 'TransporterInvoice model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(TransporterInvoice) where?: Where<TransporterInvoice>,
  ): Promise<Count> {
    return this.transporterInvoiceRepository.count(where);
  }

  @get('/transporter-invoices', {
    responses: {
      '200': {
        description: 'Array of TransporterInvoice model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(TransporterInvoice, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(TransporterInvoice) filter?: Filter<TransporterInvoice>,
  ): Promise<TransporterInvoice[]> {
    return this.transporterInvoiceRepository.find(filter);
  }

  @patch('/transporter-invoices', {
    responses: {
      '200': {
        description: 'TransporterInvoice PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TransporterInvoice, {partial: true}),
        },
      },
    })
    transporterInvoice: TransporterInvoice,
    @param.where(TransporterInvoice) where?: Where<TransporterInvoice>,
  ): Promise<Count> {
    return this.transporterInvoiceRepository.updateAll(transporterInvoice, where);
  }

  @get('/transporter-invoices/{id}', {
    responses: {
      '200': {
        description: 'TransporterInvoice model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(TransporterInvoice, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(TransporterInvoice, {exclude: 'where'}) filter?: FilterExcludingWhere<TransporterInvoice>
  ): Promise<TransporterInvoice> {
    return this.transporterInvoiceRepository.findById(id, filter);
  }

  @patch('/transporter-invoices/{id}', {
    responses: {
      '204': {
        description: 'TransporterInvoice PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TransporterInvoice, {partial: true}),
        },
      },
    })
    transporterInvoice: TransporterInvoice,
  ): Promise<void> {
    await this.transporterInvoiceRepository.updateById(id, transporterInvoice);
  }

  @put('/transporter-invoices/{id}', {
    responses: {
      '204': {
        description: 'TransporterInvoice PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() transporterInvoice: TransporterInvoice,
  ): Promise<void> {
    await this.transporterInvoiceRepository.replaceById(id, transporterInvoice);
  }

  @del('/transporter-invoices/{id}', {
    responses: {
      '204': {
        description: 'TransporterInvoice DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.transporterInvoiceRepository.deleteById(id);
  }
}
