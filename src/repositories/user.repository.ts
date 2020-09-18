import {Getter, inject} from '@loopback/core';
import {
  DefaultCrudRepository,
  HasManyRepositoryFactory,
  HasOneRepositoryFactory,
  repository,
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {
  CfsUserRegistration,
  User,
  UserRelations,
  Userrolemapping,
} from '../models';
import {CfsUserRegistrationRepository} from './cfs-user-registration.repository';
import {UserrolemappingRepository} from './userrolemapping.repository';

export type Credentials = {
  email: string;
  password: string;
  typeSyscode: number;
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

  public readonly userrolemappings: HasManyRepositoryFactory<
    Userrolemapping,
    typeof User.prototype.userId
  >;

  public readonly cfsUserRegistration: HasOneRepositoryFactory<
    CfsUserRegistration,
    typeof User.prototype.userId
  >;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('UserrolemappingRepository')
    protected userrolemappingRepositoryGetter: Getter<
      UserrolemappingRepository
    >,
    @repository.getter('CfsUserRegistrationRepository')
    protected cfsUserRegistrationRepositoryGetter: Getter<
      CfsUserRegistrationRepository
    >,
  ) {
    super(User, dataSource);
    this.cfsUserRegistration = this.createHasOneRepositoryFactoryFor(
      'cfsUserRegistration',
      cfsUserRegistrationRepositoryGetter,
    );
    this.registerInclusionResolver(
      'cfsUserRegistration',
      this.cfsUserRegistration.inclusionResolver,
    );
    this.userrolemappings = this.createHasManyRepositoryFactoryFor(
      'userrolemappings',
      userrolemappingRepositoryGetter,
    );
    this.registerInclusionResolver(
      'userrolemappings',
      this.userrolemappings.inclusionResolver,
    );
    this.userroles = this.createHasManyRepositoryFactoryFor(
      'roles',
      userrolemappingRepositoryGetter,
    );
    this.registerInclusionResolver('roles', this.userroles.inclusionResolver);
  }
}
