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


  constructor(data?: Partial<StateMaster>) {
    super(data);
  }
}

export interface StateMasterRelations {
  // describe navigational properties here
}

export type StateMasterWithRelations = StateMaster & StateMasterRelations;
