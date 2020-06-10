import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {YardMaster, YardMasterRelations} from '../models';

export class YardMasterRepository extends DefaultCrudRepository<
  YardMaster,
  typeof YardMaster.prototype.yard_syscode,
  YardMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(YardMaster, dataSource);
  }
}
