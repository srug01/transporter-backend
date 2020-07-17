import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class CfsUserRegistration extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfsUserRegistrationId?: number;

  @property({
    type: 'number',
  })
  cfsMasterId?: number;

  @property({
    type: 'number',
  })
  userTypeId?: number;

  @property({
    type: 'string',
  })
  cfsUserName?: string;

  @property({
    type: 'string',
  })
  cfsUserDesignation?: string;

  @property({
    type: 'string',
  })
  cfsUserDepartment?: string;

  @property({
    type: 'string',
  })
  cfsUserMobileNumber?: string;

  @property({
    type: 'string',
  })
  cfsUserEmail?: string;

  @property({
    type: 'string',
  })
  cfsUserPassword?: string;

  @property({
    type: 'number',
  })
  userId?: number;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'boolean',
  })
  isVerified?: boolean;

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

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<CfsUserRegistration>) {
    super(data);
  }
}

export interface CfsUserRegistrationRelations {
  // describe navigational properties here
}

export type CfsUserRegistrationWithRelations = CfsUserRegistration &
  CfsUserRegistrationRelations;
