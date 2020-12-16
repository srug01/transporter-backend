import {DefaultCrudRepository} from '@loopback/repository';
import {TransporterInvoice, TransporterInvoiceRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class TransporterInvoiceRepository extends DefaultCrudRepository<
  TransporterInvoice,
  typeof TransporterInvoice.prototype.transporterInvoiceId,
  TransporterInvoiceRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(TransporterInvoice, dataSource);
  }
}
