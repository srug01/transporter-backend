/* eslint-disable @typescript-eslint/camelcase */
import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {WeightMaster, WeightMasterRelations} from '../models';

export class WeightMasterRepository extends DefaultCrudRepository<
  WeightMaster,
  typeof WeightMaster.prototype.weight_syscode,
  WeightMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(WeightMaster, dataSource);
  }
}
