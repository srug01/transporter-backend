import {Entity, model, property} from '@loopback/repository';

@model()
export class StateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  state_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  state: string;


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


  constructor(data?: Partial<StateMaster>) {
    super(data);
  }
}

export interface StateMasterRelations {
  // describe navigational properties here
}

export type StateMasterWithRelations = StateMaster & StateMasterRelations;
