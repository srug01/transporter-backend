import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'weightmaster'
    },
    strict: false
  }
})
export class WeightMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  weightMasterId?: number;

  @property({
    type: 'string',
  })
  weightDesc?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'string',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'string',
  })
  modifiedOn?: string;

  @property({
    type: 'number',
  })
  containerMasterId?: number;

  constructor(data?: Partial<WeightMaster>) {
    super(data);
  }
}

export interface WeightMasterRelations {
  // describe navigational properties here
}

export type WeightMasterWithRelations = WeightMaster & WeightMasterRelations;
