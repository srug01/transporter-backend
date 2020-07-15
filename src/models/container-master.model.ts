import {Entity, model, property, hasMany} from '@loopback/repository';
import {WeightMaster} from './weight-master.model';

@model({settings: {strict: false}})
export class ContainerMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  containerMasterId?: number;

  @property({
    type: 'string',
  })
  containerMasterName?: string;

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

  @hasMany(() => WeightMaster)
  weightMasters: WeightMaster[];
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<ContainerMaster>) {
    super(data);
  }
}

export interface ContainerMasterRelations {
  // describe navigational properties here
}

export type ContainerMasterWithRelations = ContainerMaster & ContainerMasterRelations;
