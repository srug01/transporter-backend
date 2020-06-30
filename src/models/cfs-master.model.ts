import {Entity, model, property} from '@loopback/repository';

@model()
export class CfsMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfs_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  cfs_name: string;

  @property({
    type: 'string',
    required: true,
  })
  contact_no: string;

  @property({
    type: 'string',
    required: true,
  })
  email_id: string;

  @property({
    type: 'string',
  })
  address?: string;

  @property({
    type: 'string',
    required: true,
  })
  pincode: string;

  @property({
    type: 'string',
  })
  cfs_code_no?: string;

  @property({
    type: 'string',
  })
  gstn?: string;

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
  primary_contact_name?: string;

  @property({
    type: 'string',
  })
  primary_mobile_no?: string;

  @property({
    type: 'string',
  })
  additional_contact_name?: string;

  @property({
    type: 'string',
  })
  additional_mobile_no?: string;

  @property({
    type: 'number',
    required: true,
  })
  port_syscode: number;

  @property({
    type: 'boolean',
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    default: () => 1,
  })
  created_by: number;

  @property({
    type: 'date',
    default: () => new Date(),
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

  @property({
    type: 'number',
  })
  locationId?: number;

  @property({
    type: 'number',
  })
  roleId?: number;

  @property({
    type: 'number',
  })
  userId?: number;

  constructor(data?: Partial<CfsMaster>) {
    super(data);
  }
}

export interface CfsMasterRelations {
  // describe navigational properties here
}

export type CfsMasterWithRelations = CfsMaster & CfsMasterRelations;
