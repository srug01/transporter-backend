import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'mileagemaster'
    },
    strict: false
  }
})
export class MileageMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  mileageId?: number;

  @property({
    type: 'number',
  })
  containerId?: number;

  @property({
    type: 'number',
  })
  weightId?: number;

  @property({
    type: 'string',
  })
  mileage?: string;

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

  constructor(data?: Partial<MileageMaster>) {
    super(data);
  }
}

export interface MileageMasterRelations {
  // describe navigational properties here
}

export type MileageMasterWithRelations = MileageMaster & MileageMasterRelations;
