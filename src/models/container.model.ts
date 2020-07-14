import {Entity, model, property, hasMany} from '@loopback/repository';
import {Truck} from './truck.model';

@model({settings: {strict: false}})
export class Container extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  containerId?: number;

  @property({
    type: 'number',
  })
  orderId?: number;

  @property({
    type: 'number',
  })
  weightType?: number;

  @property({
    type: 'number',
  })
  numberOfTrucks?: number;

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

  @hasMany(() => Truck)
  trucks: Truck[];
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Container>) {
    super(data);
  }
}

export interface ContainerRelations {
  // describe navigational properties here
}

export type ContainerWithRelations = Container & ContainerRelations;
