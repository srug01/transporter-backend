import {DefaultCrudRepository} from '@loopback/repository';
import {Permission, PermissionRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PermissionRepository extends DefaultCrudRepository<
  Permission,
  typeof Permission.prototype.permissionId,
  PermissionRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Permission, dataSource);
  }
}
