import {Entity, hasMany, model, property} from '@loopback/repository';
import {Container} from './container.model';

@model()
export class Order extends Entity {
  @property({
    type: 'number',
  })
  order_type_syscode?: number;

  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  orderId?: number;

  @property({
    type: 'date',
  })
  order_date?: string;

  @property({
    type: 'number',
  })
  source_syscode?: number;

  @property({
    type: 'number',
  })
  destination_syscode?: number;

  @property({
    type: 'number',
  })
  destination_type_syscode?: number;

  @property({
    type: 'number',
  })
  source_type_syscode?: number;

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
  })
  created_by?: number;

  @property({
    type: 'date',
  })
  created_on?: string;

  @property({
    type: 'number',
  })
  modify_by?: number;

  @property({
    type: 'date',
  })
  modify_on?: string;

  @property({
    type: 'any',
  })
  @hasMany(() => Container)
  containers: Container[];

  constructor(data?: Partial<Order>) {
    super(data);
  }
}

export interface OrderRelations {
  // describe navigational properties here
}

export type OrderWithRelations = Order & OrderRelations;
