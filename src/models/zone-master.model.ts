import {Entity, model, property} from '@loopback/repository';

@model()
export class ZoneMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  zone_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  zone_name: string;

  @property({
    type: 'string',
    required: true,
  })
  zone_description: string;

  @property({
    type: 'string',
  })
  pincode?: string;

  @property({
    type: 'boolean',
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    default: () => 1
  })
  created_by: number;

  @property({
    type: 'date',
    default: () => new Date()
  })
  created_on: string;

  @property({
    type: 'number',
    default: () => 1
  })
  modified_by: number;

  @property({
    type: 'date',
    default: () => new Date()
  })
  modified_on?: string;

  constructor(data?: Partial<ZoneMaster>) {
    super(data);
  }
}

export interface ZoneMasterRelations {
  // describe navigational properties here
}

export type ZoneMasterWithRelations = ZoneMaster & ZoneMasterRelations;
