import {Entity, model, property, hasMany} from '@loopback/repository';
import {CfsMaster} from './cfs-master.model';
import {YardMaster} from './yard-master.model';

@model({settings: {strict: false}})
export class PortMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  portMasterId?: number;

  @property({
    type: 'string',
  })
  portName?: string;

  @property({
    type: 'number',
  })
  stateMasterId?: number;

  @property({
    type: 'number',
  })
  locationMasterId?: number;

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
    type: 'string',
  })
  latitude?: string;

  @property({
    type: 'string',
  })
  longitude?: string;

  @hasMany(() => CfsMaster)
  cfsMasters: CfsMaster[];

  @hasMany(() => YardMaster)
  yardMasters: YardMaster[];
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<PortMaster>) {
    super(data);
  }
}

export interface PortMasterRelations {
  // describe navigational properties here
}

export type PortMasterWithRelations = PortMaster & PortMasterRelations;
