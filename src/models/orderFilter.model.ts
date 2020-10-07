import {Model, model, property} from '@loopback/repository';

@model()
export class OrderFilter extends Model {
  @property({
    type: 'number',
    default: null,
  })
  sourceId?: number;

  @property({
    type: 'number',
    default: null,
  })
  destinationId?: number;

  @property({
    type: 'string',
    default: null,
  })
  fromDate?: string;

  @property({
    type: 'string',
    default: null,
  })
  toDate?: string;


  @property({
    type: 'number',
    default: null,
  })
  orderType?: number;

  @property({
    type: 'number',
    default: null,
  })
  orderStatus?: number;

  @property({
    type: 'number',
    default: null,
  })
  custId?: number;

  @property({
    type: 'number',
    default: null,
  })
  currentUserId?: number;

  constructor(data?: Partial<OrderFilter>) {
    super(data);
  }
}

export interface OrderFilterRelations {
  // describe navigational properties here
}

export type OrderFilterWithRelations = OrderFilter & OrderFilterRelations;
