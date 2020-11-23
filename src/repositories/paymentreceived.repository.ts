import {DefaultCrudRepository} from '@loopback/repository';
import {Paymentreceived, PaymentreceivedRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PaymentreceivedRepository extends DefaultCrudRepository<
  Paymentreceived,
  typeof Paymentreceived.prototype.paymentreceivedId,
  PaymentreceivedRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Paymentreceived, dataSource);
  }
}
