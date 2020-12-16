import {Entity, model, property} from '@loopback/repository';

@model()
export class TransporterInvoice extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  transporterInvoiceId?: number;

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

  constructor(data?: Partial<TransporterInvoice>) {
    super(data);
  }
}

export interface TransporterInvoiceRelations {
  // describe navigational properties here
}

export type TransporterInvoiceWithRelations = TransporterInvoice & TransporterInvoiceRelations;
