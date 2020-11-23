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
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'number',
    required: true,
  })
  creditLimit: number;

  @property({
    type: 'number',
    required: true,
  })
  AvailableLimit: number;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

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


  constructor(data?: Partial<Paymenthistory>) {
    super(data);
  }
}

export interface PaymenthistoryRelations {
  // describe navigational properties here
}

export type PaymenthistoryWithRelations = Paymenthistory & PaymenthistoryRelations;
