import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {StateMaster, StateMasterRelations, LocationMaster} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {LocationMasterRepository} from './location-master.repository';

export class StateMasterRepository extends DefaultCrudRepository<
  StateMaster,
  typeof StateMaster.prototype.stateMasterId,
  StateMasterRelations
> {

  public readonly locationMasters: HasManyRepositoryFactory<LocationMaster, typeof StateMaster.prototype.stateMasterId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('LocationMasterRepository') protected locationMasterRepositoryGetter: Getter<LocationMasterRepository>,
  ) {
    super(StateMaster, dataSource);
    this.locationMasters = this.createHasManyRepositoryFactoryFor('locationMasters', locationMasterRepositoryGetter,);
    this.registerInclusionResolver('locationMasters', this.locationMasters.inclusionResolver);
  }
}
