import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'vehicle'
    },
    strict: false
  }
})
export class Vehicle extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  vehicleId?: number;

  @property({
    type: 'string',
  })
  vehicleNumber?: string;

  @property({
    type: 'string',
  })
  desc?: string;


  constructor(data?: Partial<Vehicle>) {
    super(data);
  }
}

export interface VehicleRelations {
  // describe navigational properties here
}

export type VehicleWithRelations = Vehicle & VehicleRelations;
