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
    required: true,
  })
  container_type: number;

  @property({
    type: 'number',
    required: true,
  })
  weight_type: number;

  @property({
    type: 'number',
    required: true,
  })
  no_of_trucks: number;

  @property({
    type: 'boolean',
    required: true,
  })
  is_delete: boolean;

  @property({
    type: 'number',
  })
  created_by?: number;

  @property({
    type: 'date',
  })
  created_on?: string;

  @property({
    type: 'number',
  })
  modify_by?: number;

  @property({
    type: 'date',
  })
  modify_on?: string;

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
