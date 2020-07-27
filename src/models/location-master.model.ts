import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class LocationMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  locationMasterId?: number;

  @property({
    type: 'string',
  })
  locationName?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

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
    type: 'number',
  })
  stateMasterId?: number;
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<LocationMaster>) {
    super(data);
  }
}

export interface LocationMasterRelations {
  // describe navigational properties here
}

export type LocationMasterWithRelations = LocationMaster &
  LocationMasterRelations;
