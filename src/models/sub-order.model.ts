import {Entity, model, property} from '@loopback/repository';

@model()
export class SubOrder extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  subOrderId?: number;

  @property({
    type: 'number',
  })
  orderId?: number;

  @property({
    type: 'number',
  })
  subOrderTotal?: number;

  @property({
    type: 'boolean',
  })
  isDelete?: boolean;

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
  cotainerId?: number;

  @property({
    type: 'string',
  })
  containerType?: number;

  @property({
    type: 'number',
  })
  containerWeightType?: number;

  @property({
    type: 'number',
  })
  subOrderTotalMargin?: number;

  @property({
    type: 'number',
  })
  marginPercent?: number;

  constructor(data?: Partial<SubOrder>) {
    super(data);
  }
}

export interface SubOrderRelations {
  // describe navigational properties here
}

export type SubOrderWithRelations = SubOrder & SubOrderRelations;
