import {DefaultCrudRepository} from '@loopback/repository';
import {Orderinvoice, OrderinvoiceRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class OrderinvoiceRepository extends DefaultCrudRepository<
  Orderinvoice,
  typeof Orderinvoice.prototype.orderInvoiceId,
  OrderinvoiceRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Orderinvoice, dataSource);
  }
}
