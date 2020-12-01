import {DefaultCrudRepository} from '@loopback/repository';
import {Tripinvoice, TripinvoiceRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class TripinvoiceRepository extends DefaultCrudRepository<
  Tripinvoice,
  typeof Tripinvoice.prototype.invoiceId,
  TripinvoiceRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Tripinvoice, dataSource);
  }
}
