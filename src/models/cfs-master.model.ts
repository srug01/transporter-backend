import {Entity, hasMany, model, property} from '@loopback/repository';
import {CfsUserRegistration} from './cfs-user-registration.model';

@model({settings: {strict: false}})
export class CfsMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfsMasterId?: number;

  @property({
    type: 'string',
  })
  cfsName?: string;

  @property({
    type: 'string',
  })
  contactNumber?: string;

  @property({
    type: 'string',
  })
  email?: string;

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
  cfsCodeNumber?: string;

  @property({
    type: 'string',
  })
  gstin?: string;

  @property({
    type: 'string',
  })
  pan?: string;

  @property({
    type: 'string',
  })
  tan?: string;

  @property({
    type: 'string',
  })
  primaryContactName?: string;

  @property({
    type: 'string',
  })
  primaryContactNumber?: string;

  @property({
    type: 'string',
  })
  additionalContactName?: string;

  @property({
    type: 'string',
  })
  additionalContactNumber?: string;

  @property({
    type: 'string',
  })
  latitude?: string;

  @property({
    type: 'string',
  })
  longitude?: string;

  @property({
    type: 'number',
  })
  portMasterId?: number;

  @property({
    type: 'number',
  })
  locationMasterId?: number;

  @property({
    type: 'number',
  })
  stateMasterId?: number;

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
    type: 'boolean',
  })
  isActive?: boolean;

  @hasMany(() => CfsUserRegistration)
  cfsUserRegistrations: CfsUserRegistration[];
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<CfsMaster>) {
    super(data);
  }
}

export interface CfsMasterRelations {
  // describe navigational properties here
}

export type CfsMasterWithRelations = CfsMaster & CfsMasterRelations;
