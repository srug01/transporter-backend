import {Entity, model, property} from '@loopback/repository';

@model()
export class Ordertruckdetails extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  order_truck_syscode?: number;

  @property({
    type: 'number',
    required: true,
  })
  order_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  order_container_syscode: number;

  @property({
    type: 'string',
  })
  truck_no?: string;

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


  constructor(data?: Partial<Ordertruckdetails>) {
    super(data);
  }
}

export interface OrdertruckdetailsRelations {
  // describe navigational properties here
}

export type OrdertruckdetailsWithRelations = Ordertruckdetails & OrdertruckdetailsRelations;
