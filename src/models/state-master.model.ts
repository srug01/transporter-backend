import {Entity, hasMany, model, property} from '@loopback/repository';
import {LocationMaster} from './location-master.model';
import {PortMaster} from './port-master.model';

@model({
  settings: {
    mysql: {
      table: 'statemaster'
    },
    strict: false
  }
})
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
    type: 'string',

  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'string',

  })
  modifiedOn?: string;

  @hasMany(() => LocationMaster)
  locationMasters: LocationMaster[];
  @hasMany(() => PortMaster)
  portMasters: PortMaster[];

  constructor(data?: Partial<StateMaster>) {
    super(data);
  }
}

export interface StateMasterRelations {
  // describe navigational properties here
}

export type StateMasterWithRelations = StateMaster & StateMasterRelations;
