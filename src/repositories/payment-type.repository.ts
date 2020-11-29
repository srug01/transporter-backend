import {DefaultCrudRepository} from '@loopback/repository';
import {PaymentType, PaymentTypeRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class PaymentTypeRepository extends DefaultCrudRepository<
  PaymentType,
  typeof PaymentType.prototype.paymentTypeId,
  PaymentTypeRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(PaymentType, dataSource);
  }
}
