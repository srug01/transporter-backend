import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {DieselRateMaster, DieselRateMasterRelations} from '../models';

export class DieselRateMasterRepository extends DefaultCrudRepository<
  DieselRateMaster,
  typeof DieselRateMaster.prototype.diesel_rate_syscode,
  DieselRateMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(DieselRateMaster, dataSource);
  }
}
