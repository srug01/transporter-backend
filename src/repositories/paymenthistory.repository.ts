import {DefaultCrudRepository} from '@loopback/repository';
import {Paymenthistory, PaymenthistoryRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PaymenthistoryRepository extends DefaultCrudRepository<
  Paymenthistory,
  typeof Paymenthistory.prototype.paymenthistoryId,
  PaymenthistoryRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Paymenthistory, dataSource);
  }
}
