/* eslint-disable @typescript-eslint/no-explicit-any */
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
import {Trip, Tripinvoice} from '../models';
import {TripinvoiceRepository, TripRepository} from '../repositories';
import {MyUserProfile} from '../types';

export class TripInvoiceController {
  constructor(
    @repository(TripinvoiceRepository)
    public tripinvoiceRepository : TripinvoiceRepository,
    @repository(TripRepository)
    public tripRepository: TripRepository,
    @inject(AuthenticationBindings.CURRENT_USER)
    public currentUser: MyUserProfile,


  ) {}

  @post('/tripinvoices', {
    responses: {
      '200': {
        description: 'Tripinvoice model instance',
        content: {'application/json': {schema: getModelSchemaRef(Tripinvoice)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Tripinvoice, {
            title: 'NewTripinvoice',
            exclude: ['invoiceId'],
          }),
        },
      },
    })
    tripinvoice: Omit<Tripinvoice, 'invoiceId'>,
  ): Promise<Tripinvoice> {
    const trinvoice = await  this.tripinvoiceRepository.create(tripinvoice);
    const trip = {
      isInvoiceGenerated : true,
      invoiceId: trinvoice.getId(),
      tripId:trinvoice.tripId
    } as Trip;
    const updateTrip = await this.tripRepository.updateById(trip.tripId, trip);
    return trinvoice;
  }


  @post('/generatetripinvoices', {
    responses: {
      '200': {
        description: 'Tripinvoices',
        content: {'application/json': {schema: {type: 'array',}}},
      },
    },
  })
  @authenticate('jwt')
  async createinvoices(
    @requestBody({
      content: {
        'application/json' : {schema:{type: 'array',}},
      },
    })
    tripinvoice: any,

  ): Promise<any> {

    let obj = "Trip(s) not Completed with SubOrder(s) : ";

    // eslint-disable-next-line @typescript-eslint/prefer-for-of
    for(let i=0; i < tripinvoice.length;i++)
    {
      if(tripinvoice[i].tripStatusId === 20)
      {
      if(tripinvoice[i].invoiceId === 0 )
      {
      const tripInvoiceObj = {
        tripId: tripinvoice[i].tripId,
        subOrderId:  tripinvoice[i].subOrderId,
        invoiceNumber: "",
        originalamount: tripinvoice[i].BidValue,
        otheramount: tripinvoice[i].billedAmount === null? 0 : tripinvoice[i].billedAmount,
        invoiceamount: (tripinvoice[i].BidValue) + (tripinvoice[i].billedAmount === null? 0 : tripinvoice[i].billedAmount),
        remarks: "",
        createdBy: parseInt(this.currentUser.userId,10),
        createdFor:  tripinvoice[i].createdBy,
        createdOn: tripinvoice[i].createdOn
      } as Tripinvoice
      const trinvoice = await  this.tripinvoiceRepository.create(tripInvoiceObj);
    const trip = {
      isInvoiceGenerated : true,
      invoiceId: trinvoice.getId(),
      tripId:trinvoice.tripId
    } as Trip;
    const updateTrip = await this.tripRepository.updateById(trip.tripId, trip);

    }
  }
  else{
    obj = obj + tripinvoice[i].subOrderId + ",";
  }
  }
  if(obj.length === 0)
  {
    obj = "Success";
  }

    return JSON.stringify(obj);
  }

  @get('/tripinvoices/count', {
    responses: {
      '200': {
        description: 'Tripinvoice model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(Tripinvoice) where?: Where<Tripinvoice>,
  ): Promise<Count> {
    return this.tripinvoiceRepository.count(where);
  }

  @get('/tripinvoices', {
    responses: {
      '200': {
        description: 'Array of Tripinvoice model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Tripinvoice, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(Tripinvoice) filter?: Filter<Tripinvoice>,
  ): Promise<Tripinvoice[]> {
    return this.tripinvoiceRepository.find(filter);
  }

  @patch('/tripinvoices', {
    responses: {
      '200': {
        description: 'Tripinvoice PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Tripinvoice, {partial: true}),
        },
      },
    })
    tripinvoice: Tripinvoice,
    @param.where(Tripinvoice) where?: Where<Tripinvoice>,
  ): Promise<Count> {
    return this.tripinvoiceRepository.updateAll(tripinvoice, where);
  }

  @get('/tripinvoices/{id}', {
    responses: {
      '200': {
        description: 'Tripinvoice model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Tripinvoice, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Tripinvoice, {exclude: 'where'}) filter?: FilterExcludingWhere<Tripinvoice>
  ): Promise<Tripinvoice> {
    return this.tripinvoiceRepository.findById(id, filter);
  }

  @patch('/tripinvoices/{id}', {
    responses: {
      '204': {
        description: 'Tripinvoice PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Tripinvoice, {partial: true}),
        },
      },
    })
    tripinvoice: Tripinvoice,
  ): Promise<void> {
    await this.tripinvoiceRepository.updateById(id, tripinvoice);
  }

  @put('/tripinvoices/{id}', {
    responses: {
      '204': {
        description: 'Tripinvoice PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() tripinvoice: Tripinvoice,
  ): Promise<void> {
    await this.tripinvoiceRepository.replaceById(id, tripinvoice);
  }

  @del('/tripinvoices/{id}', {
    responses: {
      '204': {
        description: 'Tripinvoice DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.tripinvoiceRepository.deleteById(id);
  }
}
