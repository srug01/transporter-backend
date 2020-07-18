import {DefaultCrudRepository} from '@loopback/repository';
import {Bidusermapping, BidusermappingRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class BidusermappingRepository extends DefaultCrudRepository<
  Bidusermapping,
  typeof Bidusermapping.prototype.bidusermappingId,
  BidusermappingRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Bidusermapping, dataSource);
  }
}
