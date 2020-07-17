import {Entity, model, property} from '@loopback/repository';

@model()
export class Userrole extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  roleId?: number;

  @property({
    type: 'string',
    required: true,
  })
  roleName: string;

  @property({
    type: 'boolean',
    required: true,
  })
  is_active: boolean;

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

  @property({
    type: 'number',
  })
  parentRoleId: number;

  constructor(data?: Partial<Userrole>) {
    super(data);
  }
}

export interface UserroleRelations {
  // describe navigational properties here
}

export type UserroleWithRelations = Userrole & UserroleRelations;
