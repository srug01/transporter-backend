import {Model, model, property} from '@loopback/repository';

@model()
export class BidFilter extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  orderId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  transporterId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  bidUserStatusId?: number;


  constructor(data?: Partial<BidFilter>) {
    super(data);
  }
}

export interface BidFilterRelations {
  // describe navigational properties here
}

export type BidFilterWithRelations = BidFilter & BidFilterRelations;
