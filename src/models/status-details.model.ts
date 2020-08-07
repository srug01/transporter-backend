import {Entity, model, property} from '@loopback/repository';

@model()
export class StatusDetails extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  statusDetailsId?: number;

  @property({
    type: 'number',
    required: true,
  })
  statusMasterId: number;

  @property({
    type: 'string',
    required: true,
  })
  statusDetailsName: string;

  @property({
    type: 'boolean',
    required: true,
  })
  isActive: boolean;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

  @property({
    type: 'date',
    required: true,
  })
  createdOn: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;


  constructor(data?: Partial<StatusDetails>) {
    super(data);
  }
}

export interface StatusDetailsRelations {
  // describe navigational properties here
}

export type StatusDetailsWithRelations = StatusDetails & StatusDetailsRelations;
