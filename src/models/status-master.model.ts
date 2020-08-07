import {Entity, model, property} from '@loopback/repository';

@model()
export class StatusMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  statusMasterId?: number;

  @property({
    type: 'string',
    required: true,
  })
  statusMasterName: string;

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


  constructor(data?: Partial<StatusMaster>) {
    super(data);
  }
}

export interface StatusMasterRelations {
  // describe navigational properties here
}

export type StatusMasterWithRelations = StatusMaster & StatusMasterRelations;
