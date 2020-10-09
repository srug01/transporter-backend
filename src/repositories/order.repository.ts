import {Getter, inject} from '@loopback/core';
import {
  DefaultCrudRepository,
  HasManyRepositoryFactory,
  repository,
} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {Container, Order, OrderRelations} from '../models';
import {ContainerRepository} from './container.repository';

export class OrderRepository extends DefaultCrudRepository<
  Order,
  typeof Order.prototype.orderId,
  OrderRelations
> {
  public readonly containers: HasManyRepositoryFactory<
    Container,
    typeof Order.prototype.orderId
  >;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
    @repository.getter('ContainerRepository')
    protected containerRepositoryGetter: Getter<ContainerRepository>,
  ) {
    super(Order, dataSource);
    this.containers = this.createHasManyRepositoryFactoryFor(
      'containers',
      containerRepositoryGetter,
    );
    this.registerInclusionResolver(
      'containers',
      this.containers.inclusionResolver,
    );
    //const repo = new DefaultTransactionalRepository(Order, dataSource);
    // Now we have a transaction (tx)
    // const tx = await repo.beginTransaction(IsolationLevel.READ_COMMITTED);
  }
}
