import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {Timeslotmaster, TimeslotmasterRelations} from '../models';

export class TimeslotmasterRepository extends DefaultCrudRepository<
  Timeslotmaster,
  typeof Timeslotmaster.prototype.timeslotMasterId,
  TimeslotmasterRelations
> {
  constructor(@inject('datasources.test') dataSource: TestDataSource) {
    super(Timeslotmaster, dataSource);
  }
}
