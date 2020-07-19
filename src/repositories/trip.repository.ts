import {DefaultCrudRepository} from '@loopback/repository';
import {Trip, TripRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class TripRepository extends DefaultCrudRepository<
  Trip,
  typeof Trip.prototype.tripId,
  TripRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Trip, dataSource);
  }
}
