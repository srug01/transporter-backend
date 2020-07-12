import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class PortTerminalMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  portTerminalId?: number;

  @property({
    type: 'number',
  })
  portId?: number;

  @property({
    type: 'string',
  })
  terminal?: string;

  @property({
    type: 'string',
  })
  longitude?: string;

  @property({
    type: 'string',
  })
  latitude?: string;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  CreatedOn?: string;

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

  constructor(data?: Partial<PortTerminalMaster>) {
    super(data);
  }
}

export interface PortTerminalMasterRelations {
  // describe navigational properties here
}

export type PortTerminalMasterWithRelations = PortTerminalMaster & PortTerminalMasterRelations;