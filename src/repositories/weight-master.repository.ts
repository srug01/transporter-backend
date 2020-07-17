import {DefaultCrudRepository} from '@loopback/repository';
import {WeightMaster, WeightMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class WeightMasterRepository extends DefaultCrudRepository<
  WeightMaster,
  typeof WeightMaster.prototype.weightMasterId,
  WeightMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(WeightMaster, dataSource);
  }
}
