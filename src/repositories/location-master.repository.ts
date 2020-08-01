import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {LocationMaster, LocationMasterRelations} from '../models';

export class LocationMasterRepository extends DefaultCrudRepository<
  LocationMaster,
  typeof LocationMaster.prototype.locationMasterId,
  LocationMasterRelations
> {
  constructor(@inject('datasources.test') dataSource: TestDataSource) {
    super(LocationMaster, dataSource);
  }
}
