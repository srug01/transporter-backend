import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'dieselratemaster'
    },
    strict: false
  }
})
export class DieselRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  dieselRateId?: number;

  @property({
    type: 'number',
  })
  dieselRate?: number;

  @property({
    type: 'date',
  })
  dieselRateDate?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<DieselRateMaster>) {
    super(data);
  }
}

export interface DieselRateMasterRelations {
  // describe navigational properties here
}

export type DieselRateMasterWithRelations = DieselRateMaster & DieselRateMasterRelations;
