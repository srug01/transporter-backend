import {DefaultCrudRepository} from '@loopback/repository';
import {VehicleMaster, VehicleMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class VehicleMasterRepository extends DefaultCrudRepository<
  VehicleMaster,
  typeof VehicleMaster.prototype.vehicleMasterId,
  VehicleMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(VehicleMaster, dataSource);
  }
}
