import {authenticate, AuthenticationBindings} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,


  patch, post,




  put,

  requestBody
} from '@loopback/rest';
import {TransporterInvoice, Trip} from '../models';
import {TransporterInvoiceRepository, TripRepository} from '../repositories';
import {MyUserProfile} from '../types';
@authenticate('jwt')
export class TransporterInvoiceController {
  constructor(
    @repository(TransporterInvoiceRepository)
    public transporterInvoiceRepository : TransporterInvoiceRepository,
    @repository(TripRepository)
    public tripRepository: TripRepository,
    @inject(AuthenticationBindings.CURRENT_USER)
    public currentUser: MyUserProfile,
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

  @post('/generatetransportertripinvoices', {
    responses: {
      '200': {
        description: 'Tripinvoices',
        content: {'application/json': {schema: {type: 'array',}}},
      },
    },
  })
  @authenticate('jwt')
  async createtransporterinvoices(
    @requestBody({
      content: {
        'application/json' : {schema:{type: 'array',}},
      },
    })
    tripinvoice: any,

  ): Promise<any> {

    let obj = "Trip(s) not Completed with SubOrder(s) : ";
    let cnt = 0;
    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for(let i=0; i < tripinvoice.length;i++)
    {
      if(tripinvoice[i].tripStatusId === 20)
      {
      if(tripinvoice[i].transporterInvoiceId === 0 )
      {


      const transtripInvoiceObj = {
        tripId: tripinvoice[i].tripId,
        subOrderId:  tripinvoice[i].subOrderId,
        invoiceNumber: "",
        originalamount: tripinvoice[i].BidValue,
        otheramount: tripinvoice[i].billedAmount === null? 0 : tripinvoice[i].billedAmount,
        invoiceamount: (tripinvoice[i].BidValue) + (tripinvoice[i].billedAmount === null? 0 : tripinvoice[i].billedAmount),
        remarks: "",
        createdBy: parseInt(this.currentUser.userId,10),
        createdFor:  1,
        createdOn: tripinvoice[i].createdOn
      } as TransporterInvoice
      const trinvoice = await  this.transporterInvoiceRepository.create(transtripInvoiceObj);
    const trip = {
      transporterInvoiceGenerated : true,
      transporterInvoiceId: trinvoice.getId(),
      tripId:trinvoice.tripId
    } as Trip;
    const updateTrip = await this.tripRepository.updateById(trip.tripId, trip);

    }
  }
  else{
    obj = obj + tripinvoice[i].subOrderId + ",";
    cnt += 1;
  }
  }
  if(cnt === 0)
  {
    obj = "Success";
  }

    return JSON.stringify(obj);
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
