import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {PortMaster, PortMasterRelations, CfsMaster, YardMaster} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {CfsMasterRepository} from './cfs-master.repository';
import {YardMasterRepository} from './yard-master.repository';

export class PortMasterRepository extends DefaultCrudRepository<
  PortMaster,
  typeof PortMaster.prototype.portMasterId,
  PortMasterRelations
> {

  public readonly cfsMasters: HasManyRepositoryFactory<CfsMaster, typeof PortMaster.prototype.portMasterId>;

  public readonly yardMasters: HasManyRepositoryFactory<YardMaster, typeof PortMaster.prototype.portMasterId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('CfsMasterRepository') protected cfsMasterRepositoryGetter: Getter<CfsMasterRepository>, @repository.getter('YardMasterRepository') protected yardMasterRepositoryGetter: Getter<YardMasterRepository>,
  ) {
    super(PortMaster, dataSource);
    this.yardMasters = this.createHasManyRepositoryFactoryFor('yardMasters', yardMasterRepositoryGetter,);
    this.registerInclusionResolver('yardMasters', this.yardMasters.inclusionResolver);
    this.cfsMasters = this.createHasManyRepositoryFactoryFor('cfsMasters', cfsMasterRepositoryGetter,);
    this.registerInclusionResolver('cfsMasters', this.cfsMasters.inclusionResolver);
  }
}
