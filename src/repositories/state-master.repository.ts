import {Getter, inject} from '@loopback/core';
import {
  DefaultCrudRepository,
  HasManyRepositoryFactory,
  repository,
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {
  LocationMaster,
  PortMaster,
  StateMaster,
  StateMasterRelations,
} from '../models';
import {LocationMasterRepository} from './location-master.repository';
import {PortMasterRepository} from './port-master.repository';

export class StateMasterRepository extends DefaultCrudRepository<
  StateMaster,
  typeof StateMaster.prototype.stateMasterId,
  StateMasterRelations
> {
  public readonly locationMasters: HasManyRepositoryFactory<
    LocationMaster,
    typeof StateMaster.prototype.stateMasterId
  >;
  public readonly portMasters: HasManyRepositoryFactory<
    PortMaster,
    typeof StateMaster.prototype.stateMasterId
  >;
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('LocationMasterRepository')
    protected locationMasterRepositoryGetter: Getter<LocationMasterRepository>,
    @repository.getter('PortMasterRepository')
    protected portMasterRepositoryGetter: Getter<PortMasterRepository>,
  ) {
    super(StateMaster, dataSource);
    this.locationMasters = this.createHasManyRepositoryFactoryFor(
      'locationMasters',
      locationMasterRepositoryGetter,
    );
    this.registerInclusionResolver(
      'locationMasters',
      this.locationMasters.inclusionResolver,
    );
    this.portMasters = this.createHasManyRepositoryFactoryFor(
      'portMasters',
      portMasterRepositoryGetter,
    );
    this.registerInclusionResolver(
      'portMasters',
      this.portMasters.inclusionResolver,
    );

    // super(StateMaster, dataSource);
  }
}
