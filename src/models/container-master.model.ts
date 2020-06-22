import {Entity, model, property} from '@loopback/repository';

@model()
export class ContainerMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  container_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  container_name: string;

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

  constructor(data?: Partial<ContainerMaster>) {
    super(data);
  }
}

export interface ContainerMasterRelations {
  // describe navigational properties here
}

export type ContainerMasterWithRelations = ContainerMaster &
  ContainerMasterRelations;
