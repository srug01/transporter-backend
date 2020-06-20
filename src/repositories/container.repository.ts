import {DefaultCrudRepository} from '@loopback/repository';
import {Container, ContainerRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class ContainerRepository extends DefaultCrudRepository<
  Container,
  typeof Container.prototype.containerId,
  ContainerRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Container, dataSource);
  }
}
