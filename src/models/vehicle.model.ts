import {Entity, model, property} from '@loopback/repository';

@model()
export class Vehicle extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  vehicle_no: string;

  @property({
    type: 'string',
  })
  description?: string;


  constructor(data?: Partial<Vehicle>) {
    super(data);
  }
}

export interface VehicleRelations {
  // describe navigational properties here
}

export type VehicleWithRelations = Vehicle & VehicleRelations;
