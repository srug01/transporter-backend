import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {StateMaster, StateMasterRelations} from '../models';

export class StateMasterRepository extends DefaultCrudRepository<
  StateMaster,
  typeof StateMaster.prototype.state_syscode,
  StateMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(StateMaster, dataSource);
  }
}
