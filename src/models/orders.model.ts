import {Entity, hasMany, model, property} from '@loopback/repository';
import {Ordercontainerdetails} from './ordercontainerdetails.model';

@model()
export class Orders extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  order_syscode?: number;

  @property({
    type: 'number',
    required: true,
  })
  order_type_syscode: number;

  @property({
    type: 'date',
    required: true,
  })
  order_date: string;

  @property({
    type: 'number',
    required: true,
  })
  source_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  source_type_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  destination_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  destination_type_syscode: number;

  @property({
    type: 'string',
  })
  order_remarks?: string;

  @property({
    type: 'string',
  })
  order_address?: string;

  @property({
    type: 'boolean',
  })
  is_delete?: boolean;

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
  modify_by?: number;

  @property({
    type: 'date',
  })
  modify_on?: string;

  @property({
    type: 'any'
  })
  @hasMany(() => Ordercontainerdetails, {keyTo: 'order_syscode'})
  ordercontainers: Ordercontainerdetails[];

  constructor(data?: Partial<Orders>) {
    super(data);
  }
}

export interface OrdersRelations {
  // describe navigational properties here
}

export type OrdersWithRelations = Orders & OrdersRelations;
