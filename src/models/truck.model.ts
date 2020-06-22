import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class Truck extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  truckId?: number;

  @property({
    type: 'number',
  })
  containerId?: number;

  @property({
    type: 'string',
  })
  truck_no?: string;

  @property({
    type: 'boolean',
    default: false,
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

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Truck>) {
    super(data);
  }
}

export interface TruckRelations {
  // describe navigational properties here
}

export type TruckWithRelations = Truck & TruckRelations;
