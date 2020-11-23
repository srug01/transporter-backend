import {Model, model, property} from '@loopback/repository';

@model()
export class BidAction extends Model {
  @property({
    type: 'number',
  })
  biduserMappingId?: number;

  @property({
    type: 'number',
  })
  subOrderId?: number;


  constructor(data?: Partial<BidAction>) {
    super(data);
  }
}

export interface BidActionRelations {
  // describe navigational properties here
}

export type BidActionWithRelations = BidAction & BidActionRelations;
