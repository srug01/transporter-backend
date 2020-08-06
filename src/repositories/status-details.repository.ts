import {DefaultCrudRepository} from '@loopback/repository';
import {StatusDetails, StatusDetailsRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class StatusDetailsRepository extends DefaultCrudRepository<
  StatusDetails,
  typeof StatusDetails.prototype.statusDetailsId,
  StatusDetailsRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(StatusDetails, dataSource);
  }
}
