import {Entity, model, property, hasMany} from '@loopback/repository';
import {LocationMaster} from './location-master.model';

@model()
export class StateMaster extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  stateMasterId?: number;

  @property({
    type: 'string',
  })
  stateName?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  @hasMany(() => LocationMaster)
  locationMasters: LocationMaster[];

  constructor(data?: Partial<StateMaster>) {
    super(data);
  }
}

export interface StateMasterRelations {
  // describe navigational properties here
}

export type StateMasterWithRelations = StateMaster & StateMasterRelations;
