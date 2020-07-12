import {DefaultCrudRepository} from '@loopback/repository';
import {PortTerminalMaster, PortTerminalMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PortTerminalMasterRepository extends DefaultCrudRepository<
  PortTerminalMaster,
  typeof PortTerminalMaster.prototype.portTerminalId,
  PortTerminalMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(PortTerminalMaster, dataSource);
  }
}
