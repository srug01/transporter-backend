import {belongsTo, Entity, hasMany, model, property} from '@loopback/repository';
import {Orders} from './orders.model';
import {Ordertruckdetails} from './ordertruckdetails.model';

@model()
export class Ordercontainerdetails extends Entity {
  @property({
    type: 'number',
    id: true
  })
  order_container_syscode?: number;

  // @property({
  //   type: 'number',
  //   required: true,
  // })
  // order_syscode: number;

  @belongsTo(() => Orders)
  order_syscode_key: number;

  @property({
    type: 'number',
    required: true,
  })
  container_type: number;

  @property({
    type: 'number',
    required: true,
  })
  weight_type: number;

  @property({
    type: 'number',
    required: true,
  })
  no_of_truck: number;

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
  @hasMany(() => Ordertruckdetails, {keyTo: 'order_container_syscode'})
  order_container_numbers: Ordertruckdetails[];

  // @belongsTo(() => Orders, {name: 'belongsTo'})
  // order_syscode: number;

  constructor(data?: Partial<Ordercontainerdetails>) {
    super(data);
  }
}

export interface OrdercontainerdetailsRelations {
  // describe navigational properties here
}

export type OrdercontainerdetailsWithRelations = Ordercontainerdetails &
  OrdercontainerdetailsRelations;
