import {Entity, model, property} from '@loopback/repository';

@model()
export class UserTypeMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  type_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  type_name: string;


  constructor(data?: Partial<UserTypeMaster>) {
    super(data);
  }
}

export interface UserTypeMasterRelations {
  // describe navigational properties here
}

export type UserTypeMasterWithRelations = UserTypeMaster & UserTypeMasterRelations;
