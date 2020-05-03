import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {YardPortMapping, YardPortMappingRelations} from '../models';

export class YardPortMappingRepository extends DefaultCrudRepository<
  YardPortMapping,
  typeof YardPortMapping.prototype.yard_port_mapping_syscode,
  YardPortMappingRelations
  > {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(YardPortMapping, dataSource);
  }
}
