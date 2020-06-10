import {DefaultCrudRepository} from '@loopback/repository';
import {Vehicle, VehicleRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class VehicleRepository extends DefaultCrudRepository<
  Vehicle,
  typeof Vehicle.prototype.id,
  VehicleRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Vehicle, dataSource);
  }
}
