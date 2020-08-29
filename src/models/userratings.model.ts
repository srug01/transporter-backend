import {Entity, model, property} from '@loopback/repository';

@model()
export class Userratings extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  userratingId?: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'number',
  })
  ratingStatus?: number;

  @property({
    type: 'string',
  })
  description?: string;


  constructor(data?: Partial<Userratings>) {
    super(data);
  }
}

export interface UserratingsRelations {
  // describe navigational properties here
}

export type UserratingsWithRelations = Userratings & UserratingsRelations;
