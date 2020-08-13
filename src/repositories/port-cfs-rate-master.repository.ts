import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {PortCfsRateMaster, PortCfsRateMasterRelations} from '../models';

export class PortCfsRateMasterRepository extends DefaultCrudRepository<
  PortCfsRateMaster,
  typeof PortCfsRateMaster.prototype.portCfsRateMasterId,
  PortCfsRateMasterRelations
> {
  constructor(@inject('datasources.test') dataSource: TestDataSource) {
    super(PortCfsRateMaster, dataSource);
  }
}
