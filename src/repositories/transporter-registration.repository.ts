import {DefaultCrudRepository} from '@loopback/repository';
import {TransporterRegistration, TransporterRegistrationRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class TransporterRegistrationRepository extends DefaultCrudRepository<
  TransporterRegistration,
  typeof TransporterRegistration.prototype.transporterId,
  TransporterRegistrationRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(TransporterRegistration, dataSource);
  }
}
