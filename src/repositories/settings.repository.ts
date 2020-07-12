import {DefaultCrudRepository} from '@loopback/repository';
import {Settings, SettingsRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class SettingsRepository extends DefaultCrudRepository<
  Settings,
  typeof Settings.prototype.settingsId,
  SettingsRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Settings, dataSource);
  }
}
