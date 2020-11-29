import {Entity, model, property} from '@loopback/repository';

@model()
export class PaymentType extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  paymentTypeId?: number;

  @property({
    type: 'string',
    required: true,
  })
  paymentType: string;

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

  constructor(data?: Partial<PaymentType>) {
    super(data);
  }
}

export interface PaymentTypeRelations {
  // describe navigational properties here
}

export type PaymentTypeWithRelations = PaymentType & PaymentTypeRelations;
