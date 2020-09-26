import {Model, model, property} from '@loopback/repository';

@model()
export class BidRate extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  suborderId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  bidId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  userId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  bidRate?: number;

  @property({
    type: 'number',
    default: 0,
  })
  bidValue?: number;


  constructor(data?: Partial<BidRate>) {
    super(data);
  }
}

export interface BidRateRelations {
  // describe navigational properties here
}

export type BidRateWithRelations = BidRate & BidRateRelations;
