import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'userrolemapping'
    },
    strict: false
  }
})
export class Userrolemapping extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  userroleId?: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

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
    type: 'string',
  })
  description?: string;


  constructor(data?: Partial<Userrolemapping>) {
    super(data);
  }
}

export interface UserrolemappingRelations {
  // describe navigational properties here
}

export type UserrolemappingWithRelations = Userrolemapping & UserrolemappingRelations;
