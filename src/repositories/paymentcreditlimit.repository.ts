import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {PaymentCreditLimit, PaymentCreditLimitRelations} from '../models';

export class PaymentCreditLimitRepository extends DefaultCrudRepository<
PaymentCreditLimit,
  typeof PaymentCreditLimit.prototype.paymentId,
  PaymentCreditLimitRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(PaymentCreditLimit, dataSource);
  }
}
