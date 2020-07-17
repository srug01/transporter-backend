import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class VehicleMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  vehicleMasterId?: number;

  @property({
    type: 'string',
  })
  vehicleNumber?: string;

  @property({
    type: 'string',
  })
  vehicleType?: string;

  @property({
    type: 'string',
  })
  vehicleCapacity?: string;

  @property({
    type: 'number',
  })
  weight?: number;

  @property({
    type: 'date',
  })
  manufactureYear?: string;

  @property({
    type: 'number',
  })
  stateId?: number;

  @property({
    type: 'boolean',
  })
  owned?: boolean;

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

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<VehicleMaster>) {
    super(data);
  }
}

export interface VehicleMasterRelations {
  // describe navigational properties here
}

export type VehicleMasterWithRelations = VehicleMaster & VehicleMasterRelations;
