import {Getter, inject} from '@loopback/core';
import {
  DefaultCrudRepository,
  HasManyRepositoryFactory,
  repository
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {Ordercontainerdetails, OrdercontainerdetailsRelations, Ordertruckdetails} from '../models';
import {OrdertruckdetailsRepository} from './ordertruckdetails.repository';

export class OrdercontainerdetailsRepository extends DefaultCrudRepository<Ordercontainerdetails, typeof Ordercontainerdetails.prototype.order_container_syscode, OrdercontainerdetailsRelations> {

  public readonly order_container_numbers: HasManyRepositoryFactory<Ordertruckdetails, typeof Ordercontainerdetails.prototype.order_container_syscode>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('OrdertruckdetailsRepository')
    protected OrdertruckdetailsRepositoryGetter: Getter<OrdertruckdetailsRepository>,
  ) {
    super(Ordercontainerdetails, dataSource);
    this.order_container_numbers = this.createHasManyRepositoryFactoryFor('order_container_numbers', OrdertruckdetailsRepositoryGetter);
    this.registerInclusionResolver('order_container_numbers', this.order_container_numbers.inclusionResolver);
  }
}
