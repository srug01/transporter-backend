import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {ZoneDayMaster, ZoneDayMasterRelations} from '../models';

export class ZoneDayMasterRepository extends DefaultCrudRepository<
  ZoneDayMaster,
  typeof ZoneDayMaster.prototype.zone_day_syscode,
  ZoneDayMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(ZoneDayMaster, dataSource);
  }
}
