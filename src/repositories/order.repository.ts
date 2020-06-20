import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {Order, OrderRelations, Container} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {ContainerRepository} from './container.repository';

export class OrderRepository extends DefaultCrudRepository<
  Order,
  typeof Order.prototype.orderId,
  OrderRelations
> {

  public readonly containers: HasManyRepositoryFactory<Container, typeof Order.prototype.orderId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('ContainerRepository') protected containerRepositoryGetter: Getter<ContainerRepository>,
  ) {
    super(Order, dataSource);
    this.containers = this.createHasManyRepositoryFactoryFor('containers', containerRepositoryGetter,);
    this.registerInclusionResolver('containers', this.containers.inclusionResolver);
  }
}
