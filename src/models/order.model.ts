import {Entity, hasMany, model, property} from '@loopback/repository';
import {Container} from './container.model';

@model({
  settings: {
    mysql: {
      table: 'order'
    },
    strict: false
  }
})
export class Order extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  orderId?: number;

  @property({
    type: 'number',
  })
  orderTypeId?: number;

  @property({
    type: 'date',
  })
  orderDate?: string;

  @property({
    type: 'number',
  })
  masterTypeId?: number;

  @property({
    type: 'number',
  })
  sourceId?: number;

  @property({
    type: 'number',
  })
  destinationId?: number;

  @property({
    type: 'string',
  })
  sourceType?: string;

  @property({
    type: 'string',
  })
  destinationType?: string;

  @property({
    type: 'string',
  })
  orderRemarks?: string;

  @property({
    type: 'string',
  })
  orderAddress?: string;

  @property({
    type: 'boolean',
  })
  isDeleted?: boolean;

  @property({
    type: 'boolean',
  })
  isVerified?: boolean;

  @property({
    type: 'string',
  })
  orderStatus?: string;

  @property({
    type: 'number',
  })
  orderStatusId?: number;

  @property({
    type: 'number',
  })
  createdBy?: number;

  @property({
    type: 'date',
  })
  createdOn?: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;

  @property({
    type: 'number',
  })
  totalRate?: number;

  @property({
    type: 'number',
  })
  profitRate?: number;

  @property({
    type: 'number',
  })
  portTerminalId?: number;

  @property({
    type: 'number',
  })
  profitMarginPercentage?: number;

  @property({
    type: 'number',
  })
  rateExcludingProfit?: number;

  @property({
    type: 'number',
  })
  timeslotMasterId?: number;

  @hasMany(() => Container)
  containers: Container[];
  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<Order>) {
    super(data);
  }
}

export interface OrderRelations {
  // describe navigational properties here
}

export type OrderWithRelations = Order & OrderRelations;
