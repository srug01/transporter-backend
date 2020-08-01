import {DefaultCrudRepository} from '@loopback/repository';
import {Vehicletransportermapping, VehicletransportermappingRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class VehicletransportermappingRepository extends DefaultCrudRepository<
  Vehicletransportermapping,
  typeof Vehicletransportermapping.prototype.vehicletransportermappingId,
  VehicletransportermappingRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Vehicletransportermapping, dataSource);
  }
}
