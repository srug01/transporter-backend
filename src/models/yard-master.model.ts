import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'yardmaster'
    },
    strict: false
  }
})
export class YardMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  yardMasterId?: number;

  @property({
    type: 'string',
  })
  yardName?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'string',
  })
  address1?: string;

  @property({
    type: 'string',
  })
  address2?: string;

  @property({
    type: 'string',
  })
  landmark?: string;

  @property({
    type: 'string',
  })
  pincode?: string;

  @property({
    type: 'string',
  })
  latitude?: string;

  @property({
    type: 'string',
  })
  longitude?: string;

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

  @property({
    type: 'number',
  })
  locationMasterId?: number;

  @property({
    type: 'number',
  })
  stateMasterId?: number;

  @property({
    type: 'string',
  })
  primarycontactperson?: string;

  @property({
    type: 'string',
  })
  primarycontactnumber?: string;

  constructor(data?: Partial<YardMaster>) {
    super(data);
  }
}

export interface YardMasterRelations {
  // describe navigational properties here
}

export type YardMasterWithRelations = YardMaster & YardMasterRelations;
