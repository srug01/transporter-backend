import {Entity, hasMany, model, property} from '@loopback/repository';
import {CfsMaster} from './cfs-master.model';
import {YardMaster} from './yard-master.model';
@model({
  settings: {
    mysql: {
      table: 'portmaster'
    },
    strict: false
  }
})
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
    type: 'string',
  })
  address1?: string;

  @property({
    type: 'string',
  })
  address2?: string;

  @property({
    type: 'string',
  })
  landmark?: string;

  @property({
    type: 'string',
  })
  pincode?: string;

  @property({
    type: 'string',
  })
  primarycontactperson?: string;

  @property({
    type: 'string',
  })
  primarycontactnumber?: string;

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
