import {Entity, model, property} from '@loopback/repository';
import {DateTimeISO8601} from 'aws-sdk/clients/marketplacecatalog';

@model({
  settings: {
    mysql: {
      table: 'trip',
    },
    strict: false,
  },
})
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
  tripstatus?: string;

  @property({
    type: 'number',
  })
  tripStatusId?: number;

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
    default: new Date(),
  })
  createdOn?: Date;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: DateTimeISO8601;

  @property({
    type: 'date',
    default: null,
  })
  startDate?: string;

  @property({
    type: 'date',
  })
  endDate?: string;

  @property({
    type: 'number',
    default: 0,
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

  @property({
    type: 'number',
  })
  startedBy?: number;

  @property({
    type: 'number',
  })
  stoppeddBy?: number;

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
