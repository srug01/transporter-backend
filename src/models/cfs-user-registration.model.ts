import {Entity, model, property} from '@loopback/repository';

@model()
export class CfsUserRegistration extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfs_user_registration_syscode?: number;

  @property({
    type: 'number',
    required: true,
  })
  cfs_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  user_type_syscode: number;

  @property({
    type: 'string',
    required: true,
  })
  cfs_user_name: string;

  @property({
    type: 'string',
  })
  cfs_user_designation?: string;

  @property({
    type: 'string',
  })
  cfs_user_department?: string;

  @property({
    type: 'string',
    required: true,
  })
  cfs_user_mobile_no: string;

  @property({
    type: 'string',
  })
  cfs_user_email?: string;

  @property({
    type: 'string',
  })
  cfs_user_password?: string;

  @property({
    type: 'string',
  })
  cfs_user_confirm_password?: string;

  @property({
    type: 'boolean',
    required: true,
  })
  cfs_user_is_active: boolean;

  @property({
    type: 'boolean',
    required: true,
  })
  cfs_user_is_verify: boolean;

  @property({
    type: 'number',
    required: true,
  })
  created_by: number;

  @property({
    type: 'date',
    required: true,
  })
  created_on: string;

  @property({
    type: 'number',
  })
  modified_by?: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  constructor(data?: Partial<CfsUserRegistration>) {
    super(data);
  }
}

export interface CfsUserRegistrationRelations {
  // describe navigational properties here
}

export type CfsUserRegistrationWithRelations = CfsUserRegistration &
  CfsUserRegistrationRelations;
