import {Getter, inject} from '@loopback/core';
import {
  DefaultCrudRepository,
  HasManyRepositoryFactory,
  repository,
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {Ordercontainerdetails, Orders, OrdersRelations} from '../models';
import {OrdercontainerdetailsRepository} from './ordercontainerdetails.repository';

export class OrdersRepository extends DefaultCrudRepository<
  Orders,
  typeof Orders.prototype.order_syscode,
  OrdersRelations
> {
  public readonly ordercontainers: HasManyRepositoryFactory<
    Ordercontainerdetails,
    typeof Orders.prototype.order_syscode
  >;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('OrdercontainerdetailsRepository')
    protected ordercontainerdetailsRepositoryGetter: Getter<
      OrdercontainerdetailsRepository
    >,
  ) {
    super(Orders, dataSource);
    this.ordercontainers = this.createHasManyRepositoryFactoryFor(
      'ordercontainers',
      ordercontainerdetailsRepositoryGetter,
    );
    this.registerInclusionResolver(
      'ordercontainers',
      this.ordercontainers.inclusionResolver,
    );
  }
}
