import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class Notification extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  notificationId?: number;

  @property({
    type: 'string',
  })
  notificationType?: string;

  @property({
    type: 'string',
  })
  notificationDesc?: string;

  @property({
    type: 'number',
  })
  orderId?: string;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'boolean',
  })
  isRead?: boolean;

  @property({
    type: 'number',
  })
  assignToRole?: number;

  @property({
    type: 'number',
  })
  assignToUser?: number;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Notification>) {
    super(data);
  }
}

export interface NotificationRelations {
  // describe navigational properties here
}

export type NotificationWithRelations = Notification & NotificationRelations;
