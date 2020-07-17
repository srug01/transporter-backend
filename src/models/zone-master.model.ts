import {Entity, model, property} from '@loopback/repository';

@model()
export class ZoneMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  zoneMasterId?: number;

  @property({
    type: 'string',
  })
  zoneName?: string;

  @property({
    type: 'string',
  })
  pincode?: string;

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
    type: 'string',
  })
  zoneDesc?: string;


  constructor(data?: Partial<ZoneMaster>) {
    super(data);
  }
}

export interface ZoneMasterRelations {
  // describe navigational properties here
}

export type ZoneMasterWithRelations = ZoneMaster & ZoneMasterRelations;
