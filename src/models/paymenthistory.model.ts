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
  Outstanding: number;

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

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;


  isCredit?: boolean;
  amount?: number;


  constructor(data?: Partial<Paymenthistory>) {
    super(data);
  }
}

export interface PaymenthistoryRelations {
  // describe navigational properties here
}

export type PaymenthistoryWithRelations = Paymenthistory & PaymenthistoryRelations;
