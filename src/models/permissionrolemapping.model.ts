import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'permissionrolemapping',
    },
    strict: false,
  },
})
export class Permissionrolemapping extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  permissionroleId?: number;

  @property({
    type: 'number',
    required: true,
  })
  permissionId: number;

  @property({
    type: 'number',
    required: true,
  })
  roleId: number;

  @property({
    type: 'boolean',
    required: true,
  })
  isActive: boolean;

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

  constructor(data?: Partial<Permissionrolemapping>) {
    super(data);
  }
}

export interface PermissionrolemappingRelations {
  // describe navigational properties here
}

export type PermissionrolemappingWithRelations = Permissionrolemapping &
  PermissionrolemappingRelations;
