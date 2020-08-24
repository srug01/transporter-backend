import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'cfsyardratemaster'
    },
    strict: false
  }
})
export class CfsYardRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfsYardRateMasterId?: number;

  @property({
    type: 'number',
    required: true,
  })
  cfsMasterId: number;

  @property({
    type: 'number',
    required: true,
  })
  yardMasterId: number;

  @property({
    type: 'number',
    required: true,
  })
  containerMasterId: number;

  @property({
    type: 'number',
    required: true,
  })
  weightMasterId: number;

  @property({
    type: 'number',
    required: true,
  })
  rate: number;

  @property({
    type: 'number',
  })
  bidMarginRate?: number;

  @property({
    type: 'number',
  })
  orderMarginRate?: number;

  @property({
    type: 'number',
    required: true,
  })
  portMasterId: number;

  @property({
    type: 'boolean',
    required: true,
  })
  isActive: boolean;

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

  constructor(data?: Partial<CfsYardRateMaster>) {
    super(data);
  }
}

export interface CfsYardRateMasterRelations {
  // describe navigational properties here
}

export type CfsYardRateMasterWithRelations = CfsYardRateMaster &
  CfsYardRateMasterRelations;
