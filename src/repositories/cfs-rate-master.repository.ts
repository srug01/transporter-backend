/* eslint-disable @typescript-eslint/camelcase */

import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {CfsRateMaster, CfsRateMasterRelations} from '../models';

export class CfsRateMasterRepository extends DefaultCrudRepository<
  CfsRateMaster,
  typeof CfsRateMaster.prototype.cfs_rate_syscode,
  CfsRateMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(CfsRateMaster, dataSource);
  }
}
