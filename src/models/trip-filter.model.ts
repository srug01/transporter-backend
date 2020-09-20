import {Model, model, property} from '@loopback/repository';

@model()
export class TripFilter extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  orderId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  sourceId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  destinationId?: number;

  @property({
    type: 'number',
    default: 0,
  })
  containerType?: number;

  @property({
    type: 'number',
    default: 0,
  })
  weightType?: number;

  @property({
    type: 'number',
    default: 0,
  })
  tripStatus?: number;


  constructor(data?: Partial<TripFilter>) {
    super(data);
  }
}

export interface TripFilterRelations {
  // describe navigational properties here
}

export type TripFilterWithRelations = TripFilter & TripFilterRelations;
