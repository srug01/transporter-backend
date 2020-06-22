import {DefaultCrudRepository} from '@loopback/repository';
import {Userrolemapping, UserrolemappingRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UserrolemappingRepository extends DefaultCrudRepository<
  Userrolemapping,
  typeof Userrolemapping.prototype.userroleId,
  UserrolemappingRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Userrolemapping, dataSource);
  }
}
