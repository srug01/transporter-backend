import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {MileageMaster, MileageMasterRelations} from '../models';

export class MileageMasterRepository extends DefaultCrudRepository<
  MileageMaster,
  typeof MileageMaster.prototype.mileage_syscode,
  MileageMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(MileageMaster, dataSource);
  }
}
