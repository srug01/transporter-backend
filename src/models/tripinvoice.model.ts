import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'tripinvoice',
    },
    strict: false,
  },
})
export class Tripinvoice extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  invoiceId?: number;

  @property({
    type: 'number',
    required: true,
  })
  tripId: number;

  @property({
    type: 'number',
    required: true,
  })
  subOrderId: number;

  @property({
    type: 'string',
  })
  invoiceNumber?: string;

  @property({
    type: 'number',
    required: true,
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  originalamount: number;

  @property({
    type: 'number',
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  otheramount?: number;

  @property({
    type: 'number',
    required: true,
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  invoiceamount: number;

  @property({
    type: 'string',
  })
  remarks?: string;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'number',
  })
  createdFor?: number;

  @property({
    type: 'string',

  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'string',
  })
  modifiedOn?: string;

  constructor(data?: Partial<Tripinvoice>) {
    super(data);
  }
}

export interface TripinvoiceRelations {
  // describe navigational properties here
}

export type TripinvoiceWithRelations = Tripinvoice & TripinvoiceRelations;
