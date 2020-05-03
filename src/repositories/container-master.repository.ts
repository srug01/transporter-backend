import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {ContainerMaster, ContainerMasterRelations} from '../models';

export class ContainerMasterRepository extends DefaultCrudRepository<
  ContainerMaster,
  typeof ContainerMaster.prototype.container_syscode,
  ContainerMasterRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(ContainerMaster, dataSource);
  }
}
