import {Entity, model, property} from '@loopback/repository';

@model()
export class VehicleMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  vehicle_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  vehicle_no: string;

  @property({
    type: 'string',
    required: true,
  })
  vehicle_type: string;

  @property({
    type: 'string',
    required: true,
  })
  vehicle_capacity: string;

  @property({
    type: 'string',
  })
  weight?: number;

  @property({
    type: 'string',
  })
  manufacture_year?: string;

  @property({
    type: 'string',
  })
  state_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  owned: boolean;

  @property({
    type: 'string',
    required: true,
    default: true,
  })
  is_active: boolean;

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
  modified_by?: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  constructor(data?: Partial<VehicleMaster>) {
    super(data);
  }
}

export interface VehicleMasterRelations {
  // describe navigational properties here
}

export type VehicleMasterWithRelations = VehicleMaster & VehicleMasterRelations;
