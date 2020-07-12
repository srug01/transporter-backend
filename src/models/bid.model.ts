import {Entity, model, property} from '@loopback/repository';

@model()
export class Bid extends Entity {
  @property({
    type: 'string',
  })
  bidName?: string;

  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  bidId?: number;

  @property({
    type: 'number',
  })
  original_rate?: number;

  @property({
    type: 'date',
  })
  exhibitionDate?: string;

  @property({
    type: 'number',
  })
  subOrderId?: number;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  bidUpperLimit?: number;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  @property({
    type: 'number',
  })
  bidLowerLimit?: number;

  @property({
    type: 'number',
  })
  bidRate?: number;

  @property({
    type: 'number',
  })
  marginPercent?: number;


  constructor(data?: Partial<Bid>) {
    super(data);
  }
}

export interface BidRelations {
  // describe navigational properties here
}

export type BidWithRelations = Bid & BidRelations;
