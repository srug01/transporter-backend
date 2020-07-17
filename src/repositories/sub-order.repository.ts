import {DefaultCrudRepository} from '@loopback/repository';
import {SubOrder, SubOrderRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class SubOrderRepository extends DefaultCrudRepository<
  SubOrder,
  typeof SubOrder.prototype.subOrderId,
  SubOrderRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(SubOrder, dataSource);
  }
}
