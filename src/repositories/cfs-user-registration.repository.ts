import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyRepositoryFactory, repository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {CfsUserRegistration, CfsUserRegistrationRelations, Payments, Paymentreceived, Paymenthistory} from '../models';
import {PaymentreceivedRepository} from './paymentreceived.repository';
import {PaymentsRepository} from './payments.repository';
import {PaymenthistoryRepository} from './paymenthistory.repository';

export class CfsUserRegistrationRepository extends DefaultCrudRepository<
  CfsUserRegistration,
  typeof CfsUserRegistration.prototype.cfsUserRegistrationId,
  CfsUserRegistrationRelations
> {

  public readonly payments: HasManyRepositoryFactory<Payments, typeof CfsUserRegistration.prototype.cfsUserRegistrationId>;

  public readonly paymentsReceived: HasManyRepositoryFactory<Paymentreceived, typeof CfsUserRegistration.prototype.cfsUserRegistrationId>;

  public readonly paymenthistories: HasManyRepositoryFactory<Paymenthistory, typeof CfsUserRegistration.prototype.cfsUserRegistrationId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('PaymentsRepository') protected paymentsRepositoryGetter: Getter<PaymentsRepository>, @repository.getter('PaymentreceivedRepository') protected paymentreceivedRepositoryGetter: Getter<PaymentreceivedRepository>, @repository.getter('PaymenthistoryRepository') protected paymenthistoryRepositoryGetter: Getter<PaymenthistoryRepository>,
  ) {
    super(CfsUserRegistration, dataSource);
    this.paymenthistories = this.createHasManyRepositoryFactoryFor('paymenthistories', paymenthistoryRepositoryGetter,);
    this.registerInclusionResolver('paymenthistories', this.paymenthistories.inclusionResolver);
    this.paymentsReceived = this.createHasManyRepositoryFactoryFor('paymentsReceived', paymentreceivedRepositoryGetter,);
    this.registerInclusionResolver('paymentsReceived', this.paymentsReceived.inclusionResolver);
    this.payments = this.createHasManyRepositoryFactoryFor('payments', paymentsRepositoryGetter,);
    this.registerInclusionResolver('payments', this.payments.inclusionResolver);
  }
}
