import {DefaultCrudRepository} from '@loopback/repository';
import {StateMaster, StateMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class StateMasterRepository extends DefaultCrudRepository<
  StateMaster,
  typeof StateMaster.prototype.stateMasterId,
  StateMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(StateMaster, dataSource);
  }
}
