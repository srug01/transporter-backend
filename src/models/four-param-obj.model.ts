import {Model, model, property} from '@loopback/repository';

@model()
export class FourParamObj extends Model {
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

  @property({
    type: 'any',
  })
  varFour?: any;


  constructor(data?: Partial<FourParamObj>) {
    super(data);
  }
}

export interface FourParamObjRelations {
  // describe navigational properties here
}

export type FourParamObjWithRelations = FourParamObj & FourParamObjRelations;
