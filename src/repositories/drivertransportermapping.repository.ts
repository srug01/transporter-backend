import {DefaultCrudRepository} from '@loopback/repository';
import {Drivertransportermapping, DrivertransportermappingRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class DrivertransportermappingRepository extends DefaultCrudRepository<
  Drivertransportermapping,
  typeof Drivertransportermapping.prototype.drivertransportermappingId,
  DrivertransportermappingRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Drivertransportermapping, dataSource);
  }
}
