import {Entity, model, property} from '@loopback/repository';

@model()
export class PaymentMode extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  paymentModeId?: number;

  @property({
    type: 'string',
  })
  paymentMode?: string;

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

  constructor(data?: Partial<PaymentMode>) {
    super(data);
  }
}

export interface PaymentModeRelations {
  // describe navigational properties here
}

export type PaymentModeWithRelations = PaymentMode & PaymentModeRelations;
