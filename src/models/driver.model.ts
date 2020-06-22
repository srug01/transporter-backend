import {Entity, model, property} from '@loopback/repository';

@model()
export class Driver extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  driversyscode?: number;

  @property({
    type: 'string',
    required: true,
  })
  name: string;

  @property({
    type: 'string',
    required: true,
  })
  firstname: string;

  @property({
    type: 'string',
    required: true,
  })
  lastname: string;

  @property({
    type: 'string',
  })
  emailid?: string;

  @property({
    type: 'number',
  })
  citysyscode?: number;

  @property({
    type: 'number',
  })
  countrysyscode?: number;
  @property({
    type: 'number',
  })
  statesyscode?: number;

  @property({
    type: 'string',
  })
  address?: string;

  @property({
    type: 'number',
  })
  identitytypesyscode?: number;

  @property({
    type: 'string',
  })
  identitynumber?: string;

  @property({
    type: 'boolean',
  })
  is_active?: boolean;

  @property({
    type: 'number',
  })
  pincode?: number;












  constructor(data?: Partial<Driver>) {
    super(data);
  }
}

export interface DriverRelations {
  // describe navigational properties here
}

export type DriverWithRelations = Driver & DriverRelations;
