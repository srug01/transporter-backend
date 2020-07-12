import {DefaultCrudRepository} from '@loopback/repository';
import {DieselRateMaster, DieselRateMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DieselRateMasterRepository extends DefaultCrudRepository<
  DieselRateMaster,
  typeof DieselRateMaster.prototype.dieselRateId,
  DieselRateMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(DieselRateMaster, dataSource);
  }
}
