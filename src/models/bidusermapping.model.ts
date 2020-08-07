import {Entity, model, property} from '@loopback/repository';

@model()
export class Bidusermapping extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  bidusermappingId?: number;

  @property({
    type: 'number',
    required: true,
  })
  bidId: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'string',
  })
  bidName?: string;

  @property({
    type: 'number',
  })
  bidValue?: number;

  @property({
    type: 'string',
  })
  bidStatus?: string;

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
    type: 'string',
  })
  bidLowerLimit?: string;

  @property({
    type: 'string',
  })
  SourceName?: string;

  @property({
    type: 'string',
  })
  destinationName?: string;
  @property({
    type: 'string',
  })
  containerMasterName?: string;

  @property({
    type: 'string',
  })
  weightDesc?: string;

  @property({
    type: 'number',
  })
  containerMasterId?: number;

  @property({
    type: 'number',
  })
  weightMasterId?: number;


  @property({
    type: 'number',
  })
  originalRate?: number;


  constructor(data?: Partial<Bidusermapping>) {
    super(data);
  }
}

export interface BidusermappingRelations {
  // describe navigational properties here
}

export type BidusermappingWithRelations = Bidusermapping &
  BidusermappingRelations;