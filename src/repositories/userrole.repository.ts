import {DefaultCrudRepository} from '@loopback/repository';
import {Userrole, UserroleRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class UserroleRepository extends DefaultCrudRepository<
  Userrole,
  typeof Userrole.prototype.roleId,
  UserroleRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Userrole, dataSource);
  }
}
