import {Entity, model, property} from '@loopback/repository';

@model()
export class WeightMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  weight_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  weight_description: string;

  @property({
    type: 'boolean',
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number',
    default: () => 1,
  })
  created_by: number;

  @property({
    type: 'date',
    default: () => new Date(),
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

  constructor(data?: Partial<WeightMaster>) {
    super(data);
  }
}

export interface WeightMasterRelations {
  // describe navigational properties here
}

export type WeightMasterWithRelations = WeightMaster & WeightMasterRelations;
