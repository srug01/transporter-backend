import {DefaultCrudRepository} from '@loopback/repository';
import {Ordertruckdetails, OrdertruckdetailsRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class OrdertruckdetailsRepository extends DefaultCrudRepository<
  Ordertruckdetails,
  typeof Ordertruckdetails.prototype.order_truck_syscode,
  OrdertruckdetailsRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Ordertruckdetails, dataSource);
  }
}
