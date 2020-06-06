import {DefaultCrudRepository} from '@loopback/repository';
import {CfsUserRegistration, CfsUserRegistrationRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class CfsUserRegistrationRepository extends DefaultCrudRepository<
  CfsUserRegistration,
  typeof CfsUserRegistration.prototype.cfs_user_registration_syscode,
  CfsUserRegistrationRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(CfsUserRegistration, dataSource);
  }
}
