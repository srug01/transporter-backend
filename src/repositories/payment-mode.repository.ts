import {DefaultCrudRepository} from '@loopback/repository';
import {PaymentMode, PaymentModeRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PaymentModeRepository extends DefaultCrudRepository<
  PaymentMode,
  typeof PaymentMode.prototype.paymentModeId,
  PaymentModeRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(PaymentMode, dataSource);
  }
}
