import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {VehicleMaster, VehicleMasterRelations} from '../models';

export class VehicleMasterRepository extends DefaultCrudRepository<
  VehicleMaster,
  typeof VehicleMaster.prototype.vehicle_syscode,
  VehicleMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(VehicleMaster, dataSource);
  }
}
