import {DefaultCrudRepository} from '@loopback/repository';
import {CfsMaster, CfsMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class CfsMasterRepository extends DefaultCrudRepository<
  CfsMaster,
  typeof CfsMaster.prototype.cfsMasterId,
  CfsMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(CfsMaster, dataSource);
  }
}
