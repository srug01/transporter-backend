import {DefaultCrudRepository} from '@loopback/repository';
import {MasterType, MasterTypeRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class MasterTypeRepository extends DefaultCrudRepository<
  MasterType,
  typeof MasterType.prototype.masterTypeId,
  MasterTypeRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(MasterType, dataSource);
  }
}
