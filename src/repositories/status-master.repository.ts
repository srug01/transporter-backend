import {DefaultCrudRepository} from '@loopback/repository';
import {StatusMaster, StatusMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class StatusMasterRepository extends DefaultCrudRepository<
  StatusMaster,
  typeof StatusMaster.prototype.statusMasterId,
  StatusMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(StatusMaster, dataSource);
  }
}
