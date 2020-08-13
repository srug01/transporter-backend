import {Getter, inject} from '@loopback/core';
import {
  BelongsToAccessor,
  DefaultCrudRepository,
  repository,
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {
  CfsMaster,
  CfsPortRateMaster,
  CfsPortRateMasterRelations,
} from '../models';
import {CfsMasterRepository} from './cfs-master.repository';

export class CfsPortRateMasterRepository extends DefaultCrudRepository<
  CfsPortRateMaster,
  typeof CfsPortRateMaster.prototype.cfsPortRateMasterId,
  CfsPortRateMasterRelations
> {
  public readonly cfsMaster: BelongsToAccessor<
    CfsMaster,
    typeof CfsPortRateMaster.prototype.cfsPortRateMasterId
  >;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('CfsMasterRepository')
    protected cfsMasterRepositoryGetter: Getter<CfsMasterRepository>,
  ) {
    super(CfsPortRateMaster, dataSource);
    this.cfsMaster = this.createBelongsToAccessorFor(
      'cfsMaster',
      cfsMasterRepositoryGetter,
    );
    this.registerInclusionResolver(
      'cfsMaster',
      this.cfsMaster.inclusionResolver,
    );
  }
}
