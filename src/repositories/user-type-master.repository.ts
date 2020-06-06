import {DefaultCrudRepository} from '@loopback/repository';
import {UserTypeMaster, UserTypeMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UserTypeMasterRepository extends DefaultCrudRepository<
  UserTypeMaster,
  typeof UserTypeMaster.prototype.type_syscode,
  UserTypeMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(UserTypeMaster, dataSource);
  }
}
