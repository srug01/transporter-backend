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


  constructor(data?: Partial<Bidusermapping>) {
    super(data);
  }
}

export interface BidusermappingRelations {
  // describe navigational properties here
}

export type BidusermappingWithRelations = Bidusermapping & BidusermappingRelations;
