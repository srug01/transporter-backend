import {Entity, model, property} from '@loopback/repository';

@model()
export class DieselRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  diesel_rate_syscode?: number;

  @property({
    type: 'number',
    required: true,
  })
  diesel_rate: number;

  @property({
    type: 'date',
    required: true,
  })
  date: string;

  @property({
    type: 'boolean',
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    default: () => 1,
  })
  created_by: number;

  @property({
    type: 'date',
    default: () => new Date(),
  })
  created_on: string;

  @property({
    type: 'number',
  })
  modified_by: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  constructor(data?: Partial<DieselRateMaster>) {
    super(data);
  }
}

export interface DieselRateMasterRelations {
  // describe navigational properties here
}

export type DieselRateMasterWithRelations = DieselRateMaster &
  DieselRateMasterRelations;
