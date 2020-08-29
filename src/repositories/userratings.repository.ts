import {DefaultCrudRepository} from '@loopback/repository';
import {Userratings, UserratingsRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UserratingsRepository extends DefaultCrudRepository<
  Userratings,
  typeof Userratings.prototype.userratingId,
  UserratingsRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Userratings, dataSource);
  }
}
