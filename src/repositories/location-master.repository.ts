import {DefaultCrudRepository} from '@loopback/repository';
import {LocationMaster, LocationMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class LocationMasterRepository extends DefaultCrudRepository<
  LocationMaster,
  typeof LocationMaster.prototype.locationId,
  LocationMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(LocationMaster, dataSource);
  }
}
