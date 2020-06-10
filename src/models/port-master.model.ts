import {Entity, model, property} from '@loopback/repository';

@model()
export class PortMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  port_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  port_name: string;

  @property({
    type: 'number',
    required: true,
  })
  state_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  location_syscode: number;

  @property({
    type: 'boolean',
    required: true,
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
  modified_by?: number;

  @property({
    type: 'date',
    default: () => new Date()
  })
  modified_on?: string;


  constructor(data?: Partial<PortMaster>) {
    super(data);
  }
}

export interface PortMasterRelations {
  // describe navigational properties here
}

export type PortMasterWithRelations = PortMaster & PortMasterRelations;
