import {DefaultCrudRepository} from '@loopback/repository';
import {Permissionrolemapping, PermissionrolemappingRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PermissionrolemappingRepository extends DefaultCrudRepository<
  Permissionrolemapping,
  typeof Permissionrolemapping.prototype.permissionroleId,
  PermissionrolemappingRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Permissionrolemapping, dataSource);
  }
}
