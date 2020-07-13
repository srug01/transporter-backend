import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
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
  cfsId?: number;

  @property({
    type: 'number',
  })
  yardId?: number;

  @property({
    type: 'number',
  })
  containerId?: number;

  @property({
    type: 'number',
  })
  weightId?: number;

  @property({
    type: 'number',
  })
  rate?: number;

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
  portId?: number;

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

export type YardCfsRateMasterWithRelations = YardCfsRateMaster & YardCfsRateMasterRelations;
