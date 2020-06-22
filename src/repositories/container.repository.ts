import {DefaultCrudRepository, repository, HasManyRepositoryFactory} from '@loopback/repository';
import {Container, ContainerRelations, Truck} from '../models';
import {TestDataSource} from '../datasources';
import {inject, Getter} from '@loopback/core';
import {TruckRepository} from './truck.repository';

export class ContainerRepository extends DefaultCrudRepository<
  Container,
  typeof Container.prototype.containerId,
  ContainerRelations
> {

  public readonly trucks: HasManyRepositoryFactory<Truck, typeof Container.prototype.containerId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('TruckRepository') protected truckRepositoryGetter: Getter<TruckRepository>,
  ) {
    super(Container, dataSource);
    this.trucks = this.createHasManyRepositoryFactoryFor('trucks', truckRepositoryGetter,);
    this.registerInclusionResolver('trucks', this.trucks.inclusionResolver);
  }
}
