import {DefaultCrudRepository} from '@loopback/repository';
import {CfsRateMaster, CfsRateMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class CfsRateMasterRepository extends DefaultCrudRepository<
  CfsRateMaster,
  typeof CfsRateMaster.prototype.cfsRateId,
  CfsRateMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(CfsRateMaster, dataSource);
  }
}
