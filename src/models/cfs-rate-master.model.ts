import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class CfsRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  cfsRateId?: number;

  @property({
    type: 'number',
  })
  cfsId?: number;

  @property({
    type: 'number',
  })
  portId?: number;

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

  @property({
    type: 'number',
  })
  cotainerId?: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<CfsRateMaster>) {
    super(data);
  }
}

export interface CfsRateMasterRelations {
  // describe navigational properties here
}

export type CfsRateMasterWithRelations = CfsRateMaster & CfsRateMasterRelations;
