import {Entity, model, property} from '@loopback/repository';

@model()
export class MileageMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  mileage_syscode?: number;

  @property({
    type: 'number'//,
    //required: true,
  })
  container_syscode: number;

  @property({
    type: 'number'//,
    // required: true,
  })
  weight_syscode: number;

  @property({
    type: 'string',
    required: true,
  })
  mileage: string;

  @property({
    type: 'boolean',
    required: true,
    default: true,
  })
  is_active: boolean;

  @property({
    type: 'number'//,
    // required: true,
  })
  created_by: number;

  @property({
    type: 'date'//,
    // required: true,
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

  constructor(data?: Partial<MileageMaster>) {
    super(data);
  }
}

export interface MileageMasterRelations {
  // describe navigational properties here
}

export type MileageMasterWithRelations = MileageMaster & MileageMasterRelations;
