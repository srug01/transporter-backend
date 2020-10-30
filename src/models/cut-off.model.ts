import {Model, model, property} from '@loopback/repository';

@model()
export class CutOff extends Model {
  @property({
    type: 'string',
  })
  createdOn?: string;

  @property({
    type: 'string',
  })
  orderDate?: string;

  @property({
    type: 'number',
  })
  orderTimeSlot?: number;

  @property({
    type: 'number',
  })
  runScheduler?: number;

  @property({
    type: 'string',
  })
  cutOffTime?: string;

  @property({
    type: 'number',
  })
  cutOffSlot?: number;


  constructor(data?: Partial<CutOff>) {
    super(data);
  }
}

export interface CutOffRelations {
  // describe navigational properties here
}

export type CutOffWithRelations = CutOff & CutOffRelations;
