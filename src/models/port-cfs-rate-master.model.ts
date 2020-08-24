import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'portcfsratemaster'
    },
    strict: false
  }
})
export class PortCfsRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  portCfsRateMasterId?: number;

  @property({
    type: 'number',
    required: true,
  })
  portMasterId: number;

  @property({
    type: 'number',
    required: true,
  })
  cfsMasterId: number;

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

  @property({
    type: 'number',
    required: true,
  })
  containerMasterId: number;

  constructor(data?: Partial<PortCfsRateMaster>) {
    super(data);
  }
}

export interface PortCfsRateMasterRelations {
  // describe navigational properties here
}

export type PortCfsRateMasterWithRelations = PortCfsRateMaster &
  PortCfsRateMasterRelations;
