import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {ContainerMaster, ContainerMasterRelations, WeightMaster} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {WeightMasterRepository} from './weight-master.repository';

export class ContainerMasterRepository extends DefaultCrudRepository<
  ContainerMaster,
  typeof ContainerMaster.prototype.containerMasterId,
  ContainerMasterRelations
> {

  public readonly weightMasters: HasManyRepositoryFactory<WeightMaster, typeof ContainerMaster.prototype.containerMasterId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('WeightMasterRepository') protected weightMasterRepositoryGetter: Getter<WeightMasterRepository>,
  ) {
    super(ContainerMaster, dataSource);
    this.weightMasters = this.createHasManyRepositoryFactoryFor('weightMasters', weightMasterRepositoryGetter,);
    this.registerInclusionResolver('weightMasters', this.weightMasters.inclusionResolver);
  }
}
