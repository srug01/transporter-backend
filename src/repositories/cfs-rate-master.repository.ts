import {DefaultCrudRepository, repository, BelongsToAccessor} from '@loopback/repository';
import {CfsRateMaster, CfsRateMasterRelations, CfsMaster} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {CfsMasterRepository} from './cfs-master.repository';

export class CfsRateMasterRepository extends DefaultCrudRepository<
  CfsRateMaster,
  typeof CfsRateMaster.prototype.cfsRateId,
  CfsRateMasterRelations
> {

  public readonly cfsMaster: BelongsToAccessor<CfsMaster, typeof CfsRateMaster.prototype.cfsRateId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('CfsMasterRepository') protected cfsMasterRepositoryGetter: Getter<CfsMasterRepository>,
  ) {
    super(CfsRateMaster, dataSource);
    this.cfsMaster = this.createBelongsToAccessorFor('cfsMaster', cfsMasterRepositoryGetter,);
    this.registerInclusionResolver('cfsMaster', this.cfsMaster.inclusionResolver);
  }
}
