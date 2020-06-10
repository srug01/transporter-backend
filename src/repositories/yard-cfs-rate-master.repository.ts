import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {YardCfsRateMaster, YardCfsRateMasterRelations} from '../models';

export class YardCfsRateMasterRepository extends DefaultCrudRepository<
  YardCfsRateMaster,
  typeof YardCfsRateMaster.prototype.yard_cfs_rate_syscode,
  YardCfsRateMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(YardCfsRateMaster, dataSource);
  }
}
