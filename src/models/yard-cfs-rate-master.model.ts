import {Entity, model, property} from '@loopback/repository';

@model()
export class YardCfsRateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  yard_cfs_rate_syscode?: number;

  @property({
    type: 'number',
    required: true,
  })
  cfs_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  yard_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  container_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  weight_syscode: number;

  @property({
    type: 'number',
    required: true,
  })
  rate: number;

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

  constructor(data?: Partial<YardCfsRateMaster>) {
    super(data);
  }
}

export interface YardCfsRateMasterRelations {
  // describe navigational properties here
}

export type YardCfsRateMasterWithRelations = YardCfsRateMaster & YardCfsRateMasterRelations;
