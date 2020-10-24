import {belongsTo, Entity, model, property} from '@loopback/repository';
import {CfsMaster} from './cfs-master.model';

@model({
  settings: {
    mysql: {
      table: 'cfsportratemaster'
    },
    strict: false
  }
})
export class CfsPortRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfsPortRateMasterId?: number;
  @property({
    type: 'number',
  })
  portMasterId?: number;

  @property({
    type: 'number',
  })
  weightMasterId?: number;

  @property({
    type: 'number',
  })
  rate: number;

  @property({
    type: 'number',
  })
  bidMarginRate?: number;

  @property({
    type: 'number',
  })
  orderMarginRate?: number;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'string',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'string',
  })
  modifiedOn?: string;

  @property({
    type: 'number',
  })
  containerMasterId?: number;

  @belongsTo(() => CfsMaster)
  cfsMasterId: number;
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<CfsPortRateMaster>) {
    super(data);
  }
}

export interface CfsPortRateMasterRelations {
  // describe navigational properties here
}

export type CfsPortRateMasterWithRelations = CfsPortRateMaster &
  CfsPortRateMasterRelations;
