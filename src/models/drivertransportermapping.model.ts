import {Entity, model, property} from '@loopback/repository';

@model({
  settings: {
    mysql: {
      table: 'drivertransportermapping'
    },
    strict: false
  }
})
export class Drivertransportermapping extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  drivertransportermappingId?: number;

  @property({
    type: 'number',
    required: true,
  })
  driverId: number;

  @property({
    type: 'number',
    required: true,
  })
  userId: number;

  @property({
    type: 'number',
    required: true,
  })
  createdBy: number;

  @property({
    type: 'date',
    required: true,
  })
  createdOn: string;

  @property({
    type: 'number',
  })
  modifiedBy?: number;

  @property({
    type: 'date',
  })
  modifiedOn?: string;


  constructor(data?: Partial<Drivertransportermapping>) {
    super(data);
  }
}

export interface DrivertransportermappingRelations {
  // describe navigational properties here
}

export type DrivertransportermappingWithRelations = Drivertransportermapping & DrivertransportermappingRelations;
