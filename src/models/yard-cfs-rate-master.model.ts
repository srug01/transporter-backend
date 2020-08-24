import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'yardcfsratemaster'
    },
    strict: false
  }
})
export class YardCfsRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  yardCfsRateMasterId?: number;

  @property({
    type: 'number',
  })
  cfsMasterId?: number;

  @property({
    type: 'number',
  })
  yardMasterId?: number;

  @property({
    type: 'number',
  })
  containerMasterId?: number;

  @property({
    type: 'number',
  })
  weightMasterId?: number;

  @property({
    type: 'number',
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
  })
  isActive?: boolean;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  @property({
    type: 'number',
  })
  portMasterId?: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<YardCfsRateMaster>) {
    super(data);
  }
}

export interface YardCfsRateMasterRelations {
  // describe navigational properties here
}

export type YardCfsRateMasterWithRelations = YardCfsRateMaster &
  YardCfsRateMasterRelations;
