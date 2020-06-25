/* eslint-disable @typescript-eslint/camelcase */

import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {CfsMaster, CfsMasterRelations} from '../models';

export class CfsMasterRepository extends DefaultCrudRepository<
  CfsMaster,
  typeof CfsMaster.prototype.cfs_syscode,
  CfsMasterRelations
  > {

  constructor(
    @inject('datasources.test') dataSource: TestDataSource
  ) {
    super(CfsMaster, dataSource);
  }
}
