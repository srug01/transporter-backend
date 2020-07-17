import {DefaultCrudRepository} from '@loopback/repository';
import {ZoneMaster, ZoneMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ZoneMasterRepository extends DefaultCrudRepository<
  ZoneMaster,
  typeof ZoneMaster.prototype.zoneMasterId,
  ZoneMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(ZoneMaster, dataSource);
  }
}
