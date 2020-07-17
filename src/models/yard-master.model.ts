import {Entity, model, property} from '@loopback/repository';

@model()
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
  address?: string;

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

  constructor(data?: Partial<YardMaster>) {
    super(data);
  }
}

export interface YardMasterRelations {
  // describe navigational properties here
}

export type YardMasterWithRelations = YardMaster & YardMasterRelations;
