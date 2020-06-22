import {Entity, model, property} from '@loopback/repository';

@model()
export class TransporterRegistration extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  transporter_syscode?: number;

  @property({
    type: 'string',
  })
  transporter_name?: string;

  @property({
    type: 'string',
    required: true,
  })
  transporter_mobile_no: string;

  @property({
    type: 'string',
  })
  transporter_email?: string;

  @property({
    type: 'string',
  })
  transporter_address?: string;

  @property({
    type: 'string',
  })
  transporter_pincode?: string;

  @property({
    type: 'string',
  })
  transporter_GSTIN?: string;

  @property({
    type: 'string',
  })
  transporter_PAN?: string;

  @property({
    type: 'string',
  })
  transporter_partner?: string;

  @property({
    type: 'string',
  })
  transporter_partner_PAN?: string;

  @property({
    type: 'string',
  })
  transporter_partner_address?: string;

  @property({
    type: 'string',
  })
  transporter_bank_acno?: string;

  @property({
    type: 'string',
  })
  transporter_ac_type?: string;

  @property({
    type: 'string',
  })
  transporter_bank_name?: string;

  @property({
    type: 'string',
  })
  transporter_bank_branch?: string;

  @property({
    type: 'string',
  })
  transporter_bank_ifsc?: string;

  @property({
    type: 'string',
  })
  transporter_address_file?: string;

  @property({
    type: 'string',
  })
  transporter_gst_file?: string;

  @property({
    type: 'string',
  })
  transporter_pan_file?: string;

  @property({
    type: 'string',
  })
  transporter_cheque_file?: string;

  @property({
    type: 'string',
  })
  transporter_partner_pan_file?: string;

  @property({
    type: 'string',
  })
  transporter_partner_address_file?: string;

  @property({
    type: 'boolean',
    required: true,
  })
  transporter_is_active: boolean;

  @property({
    type: 'boolean',
    required: true,
  })
  transporter_is_verify: boolean;

  @property({
    type: 'number',
    default: 2
  })
  created_by: number;

  @property({
    type: 'date',
    default: new Date()
  })
  created_on: string;

  @property({
    type: 'number',
  })
  modified_by?: number;

  @property({
    type: 'date',
  })
  modified_on?: string;

  constructor(data?: Partial<TransporterRegistration>) {
    super(data);
  }
}

export interface TransporterRegistrationRelations {
  // describe navigational properties here
}

export type TransporterRegistrationWithRelations = TransporterRegistration &
  TransporterRegistrationRelations;
