import {DefaultCrudRepository} from '@loopback/repository';
import {CfsYardRateMaster, CfsYardRateMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class CfsYardRateMasterRepository extends DefaultCrudRepository<
  CfsYardRateMaster,
  typeof CfsYardRateMaster.prototype.cfsYardRateMasterId,
  CfsYardRateMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(CfsYardRateMaster, dataSource);
  }
}
