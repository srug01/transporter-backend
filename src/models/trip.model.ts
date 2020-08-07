import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class Trip extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  tripId?: number;

  @property({
    type: 'number',
  })
  subOrderId?: number;

  @property({
    type: 'number',
  })
  sourceId?: number;

  @property({
    type: 'number',
  })
  destinationId?: number;

  @property({
    type: 'number',
  })
  assignedVehicle?: number;

  @property({
    type: 'number',
  })
  assignedDriver?: number;

  @property({
    type: 'string',
  })
  status?: string;


  @property({
    type: 'string',
  })
  destinationName?: string;

  @property({
    type: 'string',
  })
  sourceName?: string;

  @property({
    type: 'string',
  })
  vehicleNumber?: string;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
    default: new Date()
  })
  createdOn?: Date;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
    default: new Date()
  })
  modifiedOn?: Date;

  @property({
    type: 'date',
    default: new Date()
  })
  startDate?: Date;

  @property({
    type: 'date',
    default: new Date()
  })
  endDate?: string;

  @property({
    type: 'number',
    default: 0
  })
  billedAmount?: number;

  @property({
    type: 'number',
  })
  BidValue?: number;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Trip>) {
    super(data);
  }
}

export interface TripRelations {
  // describe navigational properties here
}

export type TripWithRelations = Trip & TripRelations;