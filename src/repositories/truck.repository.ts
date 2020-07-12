import {DefaultCrudRepository} from '@loopback/repository';
import {Truck, TruckRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class TruckRepository extends DefaultCrudRepository<
  Truck,
  typeof Truck.prototype.truckId,
  TruckRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Truck, dataSource);
  }
}
