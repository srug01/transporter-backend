import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'permission'
    },
    strict: false
  }
})
export class Permission extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  permissionId?: number;

  @property({
    type: 'string',
  })
  permissionName?: string;

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

  constructor(data?: Partial<Permission>) {
    super(data);
  }
}

export interface PermissionRelations {
  // describe navigational properties here
}

export type PermissionWithRelations = Permission & PermissionRelations;
