import {Entity, model, property} from '@loopback/repository';

@model()
export class PaymentCreditLimit extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  paymentId?: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'string',
  })
  date?: string;

  @property({
    type: 'number',
    required: true,
  })
  creditLimit: number;

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


  constructor(data?: Partial<PaymentCreditLimit>) {
    super(data);
  }
}

export interface PaymentCreditLimitRelations {
  // describe navigational properties here
}

export type PaymentCreditLimitWithRelations = PaymentCreditLimit & PaymentCreditLimitRelations;
