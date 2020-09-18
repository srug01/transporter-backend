import {Model, model, property} from '@loopback/repository';

@model()
export class SubOrderFilter extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  orderId?: number;

  @property({
    type: 'string',
  })
  cutOffTime?: string;

  @property({
    type: 'number',
    default: 0,
  })
  subOrderStatus?: number;

  @property({
    type: 'number',
    default: 0,
  })
  containerType?: number;

  @property({
    type: 'number',
    default: 0,
  })
  weightType?: number;

  @property({
    type: 'string',
  })
  subOrderDate?: string;


  constructor(data?: Partial<SubOrderFilter>) {
    super(data);
  }
}

export interface SubOrderFilterRelations {
  // describe navigational properties here
}

export type SubOrderFilterWithRelations = SubOrderFilter & SubOrderFilterRelations;
