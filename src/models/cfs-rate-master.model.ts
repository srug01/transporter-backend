import {Entity, model, property, belongsTo} from '@loopback/repository';
import {CfsMaster} from './cfs-master.model';

@model({settings: {strict: false}})
export class CfsRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfsRateId?: number;
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
  rate?: number;

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

  @property({
    type: 'number',
  })
  cotainerMasterId?: number;

  @belongsTo(() => CfsMaster)
  cfsMasterId: number;
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<CfsRateMaster>) {
    super(data);
  }
}

export interface CfsRateMasterRelations {
  // describe navigational properties here
}

export type CfsRateMasterWithRelations = CfsRateMaster & CfsRateMasterRelations;
