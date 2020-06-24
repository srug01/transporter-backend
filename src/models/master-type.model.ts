import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class MasterType extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  masterTypeId?: number;

  @property({
    type: 'string',
  })
  masterType?: string;

  @property({
    type: 'string',
  })
  sourceType?: string;

  @property({
    type: 'string',
  })
  destinationType?: string;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<MasterType>) {
    super(data);
  }
}

export interface MasterTypeRelations {
  // describe navigational properties here
}

export type MasterTypeWithRelations = MasterType & MasterTypeRelations;
