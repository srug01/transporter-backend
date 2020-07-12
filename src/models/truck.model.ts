import {Entity, model, property} from '@loopback/repository';

@model()
export class Truck extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  truckId?: number;

  @property({
    type: 'number',
  })
  containerId?: number;

  @property({
    type: 'string'
  })
  truckNumbers?: string;

  @property({
    type: 'boolean',
  })
  isDeleted?: boolean;

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


  constructor(data?: Partial<Truck>) {
    super(data);
  }
}

export interface TruckRelations {
  // describe navigational properties here
}

export type TruckWithRelations = Truck & TruckRelations;
