import {DefaultCrudRepository} from '@loopback/repository';
import {MileageMaster, MileageMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class MileageMasterRepository extends DefaultCrudRepository<
  MileageMaster,
  typeof MileageMaster.prototype.mileageId,
  MileageMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(MileageMaster, dataSource);
  }
}
