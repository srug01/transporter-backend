import {Entity, model, property} from '@loopback/repository';

@model()
export class ZoneDayMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  zone_day_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  zone_name: string;

  @property({
    type: 'number',
    required: true,
  })
  port_syscode: number;

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
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    required: true,
  })
  created_by: number;

  @property({
    type: 'date',
    required: true,
  })
  created_on: string;

  @property({
    type: 'number',

  })
  modified_by: number;

  @property({
    type: 'date',
  })
  modified_on?: string;


  constructor(data?: Partial<ZoneDayMaster>) {
    super(data);
  }
}

export interface ZoneDayMasterRelations {
  // describe navigational properties here
}

export type ZoneDayMasterWithRelations = ZoneDayMaster & ZoneDayMasterRelations;
