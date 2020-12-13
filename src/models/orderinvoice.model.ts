import {Entity, model, property} from '@loopback/repository';

@model()
export class Orderinvoice extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  orderInvoiceId?: number;

  @property({
    type: 'number',
    required: true,
  })
  orderId: number;

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
    default: 0,
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  otheramount?: number;

  @property({
    type: 'number',
    default: 0,
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  invoiceamount?: number;

  @property({
    type: 'string',
  })
  remarks?: string;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

  @property({
    type: 'number',
  })
  createdFor?: number;

  @property({
    type: 'string',
    required: true,
  })
  createdOn: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'string',
  })
  modifiedOn?: string;


  constructor(data?: Partial<Orderinvoice>) {
    super(data);
  }
}

export interface OrderinvoiceRelations {
  // describe navigational properties here
}

export type OrderinvoiceWithRelations = Orderinvoice & OrderinvoiceRelations;
