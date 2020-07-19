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
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  @property({
    type: 'date',
  })
  startDate?: string;

  @property({
    type: 'date',
  })
  endDate?: string;

  @property({
    type: 'number',
  })
  billedAmount?: number;

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
