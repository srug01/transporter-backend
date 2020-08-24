import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'bidusermapping'
    },
  }
})
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
    type: 'number',
  })
  bidValue?: number;

  @property({
    type: 'string',
  })
  biduserStatus?: string;

  @property({
    type: 'number',
  })
  biduserStatusId?: number;

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

  constructor(data?: Partial<Bidusermapping>) {
    super(data);
  }
}

export interface BidusermappingRelations {
  // describe navigational properties here
}

export type BidusermappingWithRelations = Bidusermapping &
  BidusermappingRelations;
