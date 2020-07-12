import {DefaultCrudRepository} from '@loopback/repository';
import {PortMaster, PortMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PortMasterRepository extends DefaultCrudRepository<
  PortMaster,
  typeof PortMaster.prototype.portMasterId,
  PortMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(PortMaster, dataSource);
  }
}
