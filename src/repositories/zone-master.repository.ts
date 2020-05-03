import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {ZoneMaster, ZoneMasterRelations} from '../models';

export class ZoneMasterRepository extends DefaultCrudRepository<
  ZoneMaster,
  typeof ZoneMaster.prototype.zone_syscode,
  ZoneMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(ZoneMaster, dataSource);
  }
}
