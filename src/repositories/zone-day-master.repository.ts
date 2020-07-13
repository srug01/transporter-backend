import {DefaultCrudRepository} from '@loopback/repository';
import {ZoneDayMaster, ZoneDayMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ZoneDayMasterRepository extends DefaultCrudRepository<
  ZoneDayMaster,
  typeof ZoneDayMaster.prototype.zoneDayMasterId,
  ZoneDayMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(ZoneDayMaster, dataSource);
  }
}
