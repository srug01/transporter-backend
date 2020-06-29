import {DefaultCrudRepository} from '@loopback/repository';
import {Driver, DriverRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DriverRepository extends DefaultCrudRepository<
  Driver,
  typeof Driver.prototype.driversyscode,
  DriverRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Driver, dataSource);
  }
}
