import {Getter, inject} from '@loopback/core';
import {
  DefaultCrudRepository,
  HasManyRepositoryFactory,
  repository
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {User, UserRelations, Userrolemapping} from '../models';
import {UserrolemappingRepository} from './userrolemapping.repository';

export type Credentials = {
  email: string;
  password: string;
};

export class UserRepository extends DefaultCrudRepository<
  User,
  typeof User.prototype.userId,
  UserRelations
  > {
  public readonly userroles: HasManyRepositoryFactory<
    Userrolemapping,
    typeof User.prototype.userId
  >;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('UserrolemappingRepository')
    protected userrolemappingRepositoryGetter: Getter<
      UserrolemappingRepository
    >,
  ) {
    super(User, dataSource);
    this.userroles = this.createHasManyRepositoryFactoryFor(
      'roles',
      userrolemappingRepositoryGetter,
    );
    this.registerInclusionResolver('roles', this.userroles.inclusionResolver);
  }
}
