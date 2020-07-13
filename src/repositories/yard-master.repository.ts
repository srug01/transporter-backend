import {DefaultCrudRepository} from '@loopback/repository';
import {YardMaster, YardMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class YardMasterRepository extends DefaultCrudRepository<
  YardMaster,
  typeof YardMaster.prototype.yardMasterId,
  YardMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(YardMaster, dataSource);
  }
}
