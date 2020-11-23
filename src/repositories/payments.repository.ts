import {inject} from '@loopback/core';
import {DefaultCrudRepository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {Payments, PaymentsRelations} from '../models';

export class PaymentsRepository extends DefaultCrudRepository<
  Payments,
  typeof Payments.prototype.paymentId,
  PaymentsRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Payments, dataSource);
  }
}
