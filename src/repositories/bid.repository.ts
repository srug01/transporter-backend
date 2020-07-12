import {DefaultCrudRepository} from '@loopback/repository';
import {Bid, BidRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class BidRepository extends DefaultCrudRepository<
  Bid,
  typeof Bid.prototype.bidId,
  BidRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Bid, dataSource);
  }
}
