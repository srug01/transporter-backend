import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {User, UserRelations} from '../models';

export type Credentials = {
  email: string;
  password: string;
};

export class UserRepository extends DefaultCrudRepository<
  User,
  typeof User.prototype.id,
  UserRelations
> {
  /*  public readonly typeSyscode: HasOneRepositoryFactory<
    UserTypeMaster,
    typeof User.prototype.id
  >; */

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    // @repository.getter('UserTypeMasterRepository')
    // protected userTypeMasterRepositoryGetter: Getter<UserTypeMasterRepository>,
  ) {
    super(User, dataSource);
    /*     this.typeSyscode = this.createHasOneRepositoryFactoryFor('typeSyscode', userTypeMasterRepositoryGetter);
    this.registerInclusionResolver('typeSyscode', this.typeSyscode.inclusionResolver);
 */
  }
}
