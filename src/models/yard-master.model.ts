import {Entity, model, property} from '@loopback/repository';

@model()
export class YardMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  yard_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  yard_name: string;

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
  modified_by?: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  constructor(data?: Partial<YardMaster>) {
    super(data);
  }
}

export interface YardMasterRelations {
  // describe navigational properties here
}

export type YardMasterWithRelations = YardMaster & YardMasterRelations;
