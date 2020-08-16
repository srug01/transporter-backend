import {Model, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class Dashboard extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  TotalOrders?: number;

  @property({
    type: 'number',
    default: 0,
  })
  TotalSubOrders?: number;

  @property({
    type: 'number',
    default: 0,
  })
  TotalBids?: number;

  @property({
    type: 'number',
    default: 0,
  })
  TotalTrips?: number;

  @property({
    type: 'array',
    itemType: 'any',
  })
  Orders?: any[];

  @property({
    type: 'array',
    itemType: 'any',
  })
  SubOrders?: any[];

  @property({
    type: 'array',
    itemType: 'any',
  })
  Bids?: any[];

  @property({
    type: 'array',
    itemType: 'any',
  })
  Trips?: any[];

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Dashboard>) {
    super(data);
  }
}

export interface DashboardRelations {
  // describe navigational properties here
}

export type DashboardWithRelations = Dashboard & DashboardRelations;
