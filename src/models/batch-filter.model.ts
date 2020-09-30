import {Model, model, property} from '@loopback/repository';

@model()
export class BatchFilter extends Model {
  @property({
    type: 'number',
    default: 0,
  })
  masterTypeId?: number;

  @property({
    type: 'boolean',
  })
  isUpdate?: boolean;

  @property({
    type: 'any',
  })
  bulkData?: any;

  constructor(data?: Partial<BatchFilter>) {
    super(data);
  }
}

export interface BatchFilterRelations {
  // describe navigational properties here
}

export type BatchFilterWithRelations = BatchFilter & BatchFilterRelations;
