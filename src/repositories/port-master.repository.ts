import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {PortMaster, PortMasterRelations} from '../models';

export class PortMasterRepository extends DefaultCrudRepository<
  PortMaster,
  typeof PortMaster.prototype.port_syscode,
  PortMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(PortMaster, dataSource);
  }
}
