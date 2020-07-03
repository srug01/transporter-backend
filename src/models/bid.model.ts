import {Entity, model, property} from '@loopback/repository';

@model()
export class Bid extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  bidId?: number;

  @property({
    type: 'string',
    required: true,
  })
  bidName: string;

  @property({
    type: 'number',
    required: true,
  })
  containerId: number;

  @property({
    type: 'number',
    required: true,
  })
  container_type: number;

  @property({
    type: 'number',
    required: true,
  })
  container_weight_type: number;

  @property({
    type: 'string',
    required: true,
  })
  source_type: string;

  @property({
    type: 'string',
    required: true,
  })
  destination_type: string;

  @property({
    type: 'number',
  })
  original_rate?: number;

  @property({
    type: 'date',
  })
  exhibition_date?: string;

  @property({
    type: 'number',
    required: true,
  })
  orderId: number;

  @property({
    type: 'boolean',
    required: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    required: true,
  })
  created_by: number;

  @property({
    type: 'date',
    required: true,
  })
  created_on: string;

  @property({
    type: 'number',
  })
  modified_by?: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  @property({
    type: 'number',
  })
  bid_upper_limit?: number;

  @property({
    type: 'number',
  })
  bid_lower_limit?: number;

  @property({
    type: 'number',
  })
  order_master_type_syscode?: number;

  @property({
    type: 'string',
  })
  source_name?: string;

  @property({
    type: 'string',
  })
  destination_name?: string;

  @property({
    type: 'number',
  })
  bid_rate?: number;

  @property({
    type: 'number',
  })
  margin_percent?: number;


  constructor(data?: Partial<Bid>) {
    super(data);
  }
}

export interface BidRelations {
  // describe navigational properties here
}

export type BidWithRelations = Bid & BidRelations;
