import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, repository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {Ordercontainerdetails, OrdercontainerdetailsRelations} from '../models';
import {OrdersRepository} from './orders.repository';

export class OrdercontainerdetailsRepository extends DefaultCrudRepository<
  Ordercontainerdetails,
  typeof Ordercontainerdetails.prototype.order_container_syscode,
  OrdercontainerdetailsRelations
> {
  /*  public readonly belongsTo: BelongsToAccessor<
    Orders,
    typeof Ordercontainerdetails.prototype.order_container_syscode
  >; */

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('OrdersRepository')
    protected ordersRepositoryGetter: Getter<OrdersRepository>,
  ) {
    super(Ordercontainerdetails, dataSource);
    //this.belongsTo = this.createBelongsToAccessorFor('belongsTo', ordersRepositoryGetter,);
    //this.registerInclusionResolver('belongsTo', this.belongsTo.inclusionResolver);
  }
}
