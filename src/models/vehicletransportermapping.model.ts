import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'vehicletransportermapping'
    },
    strict: false
  }
})
export class Vehicletransportermapping extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  vehicletransportermappingId?: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'number',
    required: true,
  })
  vehicleMasterId: number;

  @property({
    type: 'date',
    required: true,
  })
  createdOn: string;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  constructor(data?: Partial<Vehicletransportermapping>) {
    super(data);
  }
}

export interface VehicletransportermappingRelations {
  // describe navigational properties here
}

export type VehicletransportermappingWithRelations = Vehicletransportermapping &
  VehicletransportermappingRelations;
