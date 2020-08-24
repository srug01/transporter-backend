import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'settings'
    },
    strict: false
  }
})
export class Settings extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  settingsId?: number;

  @property({
    type: 'string',
  })
  settingsName?: string;

  @property({
    type: 'string',
  })
  settingsValue?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Settings>) {
    super(data);
  }
}

export interface SettingsRelations {
  // describe navigational properties here
}

export type SettingsWithRelations = Settings & SettingsRelations;
