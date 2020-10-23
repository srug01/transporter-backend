import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'portterminalmaster'
    },
    strict: false
  }
})
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
  portMasterId?: number;

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
    type: 'boolean'
  })
  isActive: boolean;

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
