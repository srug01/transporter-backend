import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'paymentreceived'
    },
    strict: false
  }
})
export class Paymentreceived extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  paymentreceivedId?: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'string',
    required: true,
  })
  receivedDate: string;

  @property({
    type: 'number',
    required: true,
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  Amount: number;

  @property({
    type: 'number',
    required: true,
  })
  paymentMode: number;

  @property({
    type: 'string',
  })
  TransactionId?: string;

  @property({
    type: 'string',
  })
  Remarks?: string;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

  @property({
    type: 'string',
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

  constructor(data?: Partial<Paymentreceived>) {
    super(data);
  }
}

export interface PaymentreceivedRelations {
  // describe navigational properties here
}

export type PaymentreceivedWithRelations = Paymentreceived & PaymentreceivedRelations;
