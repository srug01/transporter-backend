import {Model, model, property} from '@loopback/repository';

@model()
export class PaymenthistoryFilter extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  cfsuserId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  adminuserId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  amount?: number;

  @property({
    type: 'string',
  })
  dateVal?: string;

  @property({
    type: 'number',
    default: 0,
  })
  paymentType?: number;


  constructor(data?: Partial<PaymenthistoryFilter>) {
    super(data);
  }
}

export interface PaymenthistoryFilterRelations {
  // describe navigational properties here
}

export type PaymenthistoryFilterWithRelations = PaymenthistoryFilter & PaymenthistoryFilterRelations;
