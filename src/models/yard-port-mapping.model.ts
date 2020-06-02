import {Entity, model, property} from '@loopback/repository';

@model()
export class YardPortMapping extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  yard_port_mapping_syscode?: number;

  @property({
    type: 'number',
    required: true,
  })
  yard_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  port_syscode: number;

  @property({
    type: 'boolean',
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    default: 1,
  })
  created_by: number;

  @property({
    type: 'date',
    default: new Date(),
  })
  created_on: string;

  @property({
    type: 'number',
  })
  modified_by?: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  constructor(data?: Partial<YardPortMapping>) {
    super(data);
  }
}

export interface YardPortMappingRelations {
  // describe navigational properties here
}

export type YardPortMappingWithRelations = YardPortMapping &
  YardPortMappingRelations;
