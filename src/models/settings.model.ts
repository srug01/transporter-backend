import {Entity, model, property} from '@loopback/repository';

@model()
export class Settings extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  settings_syscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  settings_name: string;

  @property({
    type: 'string',
  })
  settings_value?: string;
  @property({
    type: 'boolean'
  })
  is_active: boolean;


  constructor(data?: Partial<Settings>) {
    super(data);
  }
}

export interface SettingsRelations {
  // describe navigational properties here
}

export type SettingsWithRelations = Settings & SettingsRelations;
