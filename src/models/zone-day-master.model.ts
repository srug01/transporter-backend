import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'zonedaymaster'
    },
    strict: false
  }
})
export class ZoneDayMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  zoneDayMasterId?: number;

  @property({
    type: 'string',
  })
  zoneName?: string;

  @property({
    type: 'number',
  })
  portId?: number;

  @property({
    type: 'date',
  })
  import?: string;

  @property({
    type: 'date',
  })
  export?: string;

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


  constructor(data?: Partial<ZoneDayMaster>) {
    super(data);
  }
}

export interface ZoneDayMasterRelations {
  // describe navigational properties here
}

export type ZoneDayMasterWithRelations = ZoneDayMaster & ZoneDayMasterRelations;
