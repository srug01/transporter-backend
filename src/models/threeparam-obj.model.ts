import {Model, model, property} from '@loopback/repository';

@model()
export class ThreeparamObj extends Model {
  @property({
    type: 'any',
  })
  varOne?: any;

  @property({
    type: 'any',
  })
  varTwo?: any;

  @property({
    type: 'any',
  })
  varThree?: any;


  constructor(data?: Partial<ThreeparamObj>) {
    super(data);
  }
}

export interface ThreeparamObjRelations {
  // describe navigational properties here
}

export type ThreeparamObjWithRelations = ThreeparamObj & ThreeparamObjRelations;
