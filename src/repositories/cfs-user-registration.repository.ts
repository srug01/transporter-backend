import {Getter, inject} from '@loopback/core';
import {DefaultCrudRepository, HasManyRepositoryFactory, repository} from '@loopback/repository';
import {TestDataSource} from '../datasources';
import {CfsUserRegistration, CfsUserRegistrationRelations, PaymentCreditLimit, Paymenthistory, Paymentreceived} from '../models';
import {PaymentCreditLimitRepository} from './paymentcreditlimit.repository';
import {PaymenthistoryRepository} from './paymenthistory.repository';
import {PaymentreceivedRepository} from './paymentreceived.repository';

export class CfsUserRegistrationRepository extends DefaultCrudRepository<
  CfsUserRegistration,
  typeof CfsUserRegistration.prototype.cfsUserRegistrationId,
  CfsUserRegistrationRelations
> {

  public readonly paymentcreditlimit: HasManyRepositoryFactory<PaymentCreditLimit, typeof CfsUserRegistration.prototype.cfsUserRegistrationId>;

  public readonly paymentsReceived: HasManyRepositoryFactory<Paymentreceived, typeof CfsUserRegistration.prototype.cfsUserRegistrationId>;

  public readonly paymenthistories: HasManyRepositoryFactory<Paymenthistory, typeof CfsUserRegistration.prototype.cfsUserRegistrationId>;

  constructor(
    @inject('datasources.test') dataSource: TestDataSource, @repository.getter('PaymentCreditLimitRepository') protected paymentcreditlimitRepositoryGetter: Getter<PaymentCreditLimitRepository>, @repository.getter('PaymentreceivedRepository') protected paymentreceivedRepositoryGetter: Getter<PaymentreceivedRepository>, @repository.getter('PaymenthistoryRepository') protected paymenthistoryRepositoryGetter: Getter<PaymenthistoryRepository>,
  ) {
    super(CfsUserRegistration, dataSource);
    this.paymenthistories = this.createHasManyRepositoryFactoryFor('paymenthistories', paymenthistoryRepositoryGetter,);
    this.registerInclusionResolver('paymenthistories', this.paymenthistories.inclusionResolver);
    this.paymentsReceived = this.createHasManyRepositoryFactoryFor('paymentsReceived', paymentreceivedRepositoryGetter,);
    this.registerInclusionResolver('paymentsReceived', this.paymentsReceived.inclusionResolver);
    this.paymentcreditlimit = this.createHasManyRepositoryFactoryFor('paymentcreditlimit', paymentcreditlimitRepositoryGetter,);
    this.registerInclusionResolver('paymentcreditlimit', this.paymentcreditlimit.inclusionResolver);
  }
}
