import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'paymentcreditlimit'
    },
    strict: false
  }
})
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
  creditDate?: string;

  @property({
    type: 'number',
    required: true,
    mysql: {
      dataType: 'decimal',
      precision: 10,
      scale: 2
    }
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
