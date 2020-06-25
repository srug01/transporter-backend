import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, repository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {LocationMaster, LocationMasterRelations} from '../models';
import {CfsMasterRepository} from './cfs-master.repository';

export class LocationMasterRepository extends DefaultCrudRepository<
  LocationMaster,
  typeof LocationMaster.prototype.locationId,
  LocationMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('CfsMasterRepository') protected cfsMasterRepositoryGetter: Getter<CfsMasterRepository>,
  ) {
    super(LocationMaster, dataSource);
  }
}
