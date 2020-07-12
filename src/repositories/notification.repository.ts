import {DefaultCrudRepository} from '@loopback/repository';
import {Notification, NotificationRelations} from '../models';
import {TestDataSource} from '../datasources';
import {inject} from '@loopback/core';

export class NotificationRepository extends DefaultCrudRepository<
  Notification,
  typeof Notification.prototype.notificationId,
  NotificationRelations
> {
  constructor(
    @inject('datasources.test') dataSource: TestDataSource,
  ) {
    super(Notification, dataSource);
  }
}
