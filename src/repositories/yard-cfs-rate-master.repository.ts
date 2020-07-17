import {DefaultCrudRepository} from '@loopback/repository';
import {YardCfsRateMaster, YardCfsRateMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class YardCfsRateMasterRepository extends DefaultCrudRepository<
  YardCfsRateMaster,
  typeof YardCfsRateMaster.prototype.yardCfsRateMasterId,
  YardCfsRateMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(YardCfsRateMaster, dataSource);
  }
}
