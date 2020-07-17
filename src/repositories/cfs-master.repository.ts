import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {CfsMaster, CfsMasterRelations, CfsUserRegistration} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {CfsUserRegistrationRepository} from './cfs-user-registration.repository';

export class CfsMasterRepository extends DefaultCrudRepository<
  CfsMaster,
  typeof CfsMaster.prototype.cfsMasterId,
  CfsMasterRelations
> {

  public readonly cfsUserRegistrations: HasManyRepositoryFactory<CfsUserRegistration, typeof CfsMaster.prototype.cfsMasterId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('CfsUserRegistrationRepository') protected cfsUserRegistrationRepositoryGetter: Getter<CfsUserRegistrationRepository>,
  ) {
    super(CfsMaster, dataSource);
    this.cfsUserRegistrations = this.createHasManyRepositoryFactoryFor('cfsUserRegistrations', cfsUserRegistrationRepositoryGetter,);
    this.registerInclusionResolver('cfsUserRegistrations', this.cfsUserRegistrations.inclusionResolver);
  }
}
