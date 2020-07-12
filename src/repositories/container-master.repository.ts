import {DefaultCrudRepository} from '@loopback/repository';
import {ContainerMaster, ContainerMasterRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ContainerMasterRepository extends DefaultCrudRepository<
  ContainerMaster,
  typeof ContainerMaster.prototype.containerMasterId,
  ContainerMasterRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(ContainerMaster, dataSource);
  }
}
