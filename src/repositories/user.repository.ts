import {DefaultCrudRepository} from '@loopback/repository';
import {User, UserRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export type Credentials = {
  email : string;
  password : string;
}

export class UserRepository extends DefaultCrudRepository<
  User,
  typeof User.prototype.id,
  UserRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(User, dataSource);
  }
}
