import {Entity, model, property} from '@loopback/repository';

@model()
export class Timeslotmaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  timeslotMasterId?: number;

  @property({
    type: 'string',
    required: true,
  })
  fromValue: string;

  @property({
    type: 'string',
    required: true,
  })
  toValue: string;

  @property({
    type: 'string',
    required: true,
  })
  actualValue: string;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

  @property({
    type: 'date',
    required: true,
  })
  createdOn: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  constructor(data?: Partial<Timeslotmaster>) {
    super(data);
  }
}

export interface TimeslotmasterRelations {
  // describe navigational properties here
}

export type TimeslotmasterWithRelations = Timeslotmaster &
  TimeslotmasterRelations;
