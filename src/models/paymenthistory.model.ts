import {Entity, model, property} from '@loopback/repository';

@model()
export class Paymenthistory extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  paymenthistoryId?: number;

  @property({
    type: 'number'
  })
  userId: number;

  @property({
    type: 'number'
  })
  creditLimit: number;

  @property({
    type: 'number'
  })
  AvailableLimit: number;

  @property({
    type: 'number'
  })
  Outstanding?: number;

  @property({
    type: 'number'
  })
  createdBy: number;

  @property({
    type: 'string'
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

<<<<<<< HEAD
  @property({
    type: 'number',
  })
  orderId?: number;

  @property({
    type: 'string',
  })
  orderDate?: string;

  @property({
    type: 'number',
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  orderAmount?: number;

  @property({
    type: 'string',
  })
  paymentReceivedDate?: string;

  @property({
    type: 'number',
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  paymentReceivedAmount?: number;

  @property({
    type: 'number',

  })
  paymentReceivedId?: number;

  @property({
    type: 'number',
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  creditAmount?: number;

  @property({
    type: 'string',
  })
  creditDate?: string;

  @property({
    type: 'number',
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  availableLimitAmount?: number;

  @property({
    type: 'string',
  })
  availableLimitDate?: string;

  @property({
    type: 'number',
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
  })
  balanceAmount?: number;

  @property({
    type: 'number',
  })
  paymentType?: number;
// Indexer property to allow additional data
=======
  // Indexer property to allow additional data
>>>>>>> f7fbe9bc2f6785e3a511e4a303f5911d7b916520
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;


<<<<<<< HEAD
=======
  isCredit?: boolean;
  amount?: number;
>>>>>>> f7fbe9bc2f6785e3a511e4a303f5911d7b916520


  constructor(data?: Partial<Paymenthistory>) {
    super(data);
  }
}

export interface PaymenthistoryRelations {
  // describe navigational properties here
}

export type PaymenthistoryWithRelations = Paymenthistory & PaymenthistoryRelations;
