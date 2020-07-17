import {Entity, model, property} from '@loopback/repository';

@model({settings: {strict: false}})
export class TransporterRegistration extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  transporterId?: number;

  @property({
    type: 'string',
  })
  transporterName?: string;

  @property({
    type: 'string',
  })
  transporterMobileNumber?: string;

  @property({
    type: 'string',
  })
  transporterEmail?: string;

  @property({
    type: 'string',
  })
  transporterAddress?: string;

  @property({
    type: 'string',
  })
  transporterPincode?: string;

  @property({
    type: 'string',
  })
  transporterGSTIN?: string;

  @property({
    type: 'string',
  })
  transporterPAN?: string;

  @property({
    type: 'string',
  })
  transporterPartner?: string;

  @property({
    type: 'string',
  })
  transporterPartnerPAN?: string;

  @property({
    type: 'string',
  })
  transporterPartnerAddress?: string;

  @property({
    type: 'string',
  })
  transporterBankAccNumber?: string;

  @property({
    type: 'string',
  })
  transporterBankAccType?: string;

  @property({
    type: 'string',
  })
  transporterBankName?: string;

  @property({
    type: 'string',
  })
  transporterBankBranch?: string;

  @property({
    type: 'string',
  })
  transporterBankIFSC?: string;

  @property({
    type: 'string',
  })
  transporterAddressFile?: string;

  @property({
    type: 'string',
  })
  transporterGstFile?: string;

  @property({
    type: 'string',
  })
  transporterPanFile?: string;

  @property({
    type: 'string',
  })
  transporterPermitFile?: string;

  @property({
    type: 'string',
  })
  transporterLicenseFile?: string;

  @property({
    type: 'string',
  })
  transporterOtherFile?: string;

  @property({
    type: 'boolean',
  })
  isActive?: boolean;

  @property({
    type: 'boolean',
  })
  isVerified?: boolean;

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

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  constructor(data?: Partial<TransporterRegistration>) {
    super(data);
  }
}

export interface TransporterRegistrationRelations {
  // describe navigational properties here
}

export type TransporterRegistrationWithRelations = TransporterRegistration & TransporterRegistrationRelations;
