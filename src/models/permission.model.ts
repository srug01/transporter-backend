import {Entity, model, property} from '@loopback/repository';

@model()
export class Permission extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  permissionId?: number;

  @property({
    type: 'number',
  })
  roleId?: number;

  @property({
    type: 'boolean',
  })
  dashboardFull?: boolean;

  @property({
    type: 'boolean',
  })
  dashboardRead?: boolean;

  @property({
    type: 'boolean',
  })
  dashboardWrite?: boolean;

  @property({
    type: 'boolean',
  })
  cfsFull?: boolean;

  @property({
    type: 'boolean',
  })
  cfsRead?: boolean;

  @property({
    type: 'boolean',
  })
  cfsWrite?: boolean;

  @property({
    type: 'boolean',
  })
  createOrderFull?: boolean;

  @property({
    type: 'boolean',
  })
  createOrderRead?: boolean;

  @property({
    type: 'boolean',
  })
  createOrderWrite?: boolean;

  @property({
    type: 'boolean',
  })
  listOrderFull?: boolean;

  @property({
    type: 'boolean',
  })
  listOrderRead?: boolean;

  @property({
    type: 'boolean',
  })
  listOrderWrite?: boolean;

  @property({
    type: 'boolean',
  })
  userRegistrationFull?: boolean;


  @property({
    type: 'boolean',
  })
  userRegistrationRead?: boolean;

  @property({
    type: 'boolean',
  })
  userRegistrationWrite?: boolean;

  @property({
    type: 'boolean',
  })
  userListFull?: boolean;

  @property({
    type: 'boolean',
  })
  userListRead?: boolean;

  @property({
    type: 'boolean',
  })
  userListWrite?: boolean;


  @property({
    type: 'boolean',
  })
  tranporterFull?: boolean;

  @property({
    type: 'boolean',
  })
  tranporterRead?: boolean;


  @property({
    type: 'boolean',
  })
  tranporterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  bidsFull?: boolean;

  @property({
    type: 'boolean',
  })
  bidsRead?: boolean;

  @property({
    type: 'boolean',
  })
  bidsWrite?: boolean;

  @property({
    type: 'boolean',
  })
  vehicleRegistrationFull?: boolean;

  @property({
    type: 'boolean',
  })
  vehicleRegistrationRead?: boolean;

  @property({
    type: 'boolean',
  })
  vehicleRegistrationWrite?: boolean;

  @property({
    type: 'boolean',
  })
  vehicleListFull?: boolean;

  @property({
    type: 'boolean',
  })
  vehicleListRead?: boolean;

  @property({
    type: 'boolean',
  })
  vehicleListWrite?: boolean;

  @property({
    type: 'boolean',
  })
  tranporterRegistrationFull?: boolean;

  @property({
    type: 'boolean',
  })
  tranporterRegistrationRead?: boolean;


  @property({
    type: 'boolean',
  })
  tranporterRegistrationWrite?: boolean;


  @property({
    type: 'boolean',
  })
  tranporterListFull?: boolean;


  @property({
    type: 'boolean',
  })
  tranporterListRead?: boolean;


  @property({
    type: 'boolean',
  })
  tranporterListWrite?: boolean;

  @property({
    type: 'boolean',
  })
  driverRegistrationFull?: boolean;


  @property({
    type: 'boolean',
  })
  driverRegistrationRead?: boolean;


  @property({
    type: 'boolean',
  })
  driverRegistrationWrite?: boolean;


  @property({
    type: 'boolean',
  })
  mastersFull?: boolean;


  @property({
    type: 'boolean',
  })
  mastersRead?: boolean;


  @property({
    type: 'boolean',
  })
  mastersWrite?: boolean;


  @property({
    type: 'boolean',
  })
  cfsMasterFull?: boolean;


  @property({
    type: 'boolean',
  })
  cfsMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  cfsMasterWrite?: boolean;


  @property({
    type: 'boolean',
  })
  containerMasterFull?: boolean;


  @property({
    type: 'boolean',
  })
  containerMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  containerMasterWrite?: boolean;


  @property({
    type: 'boolean',
  })
  cfsRateMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  cfsRateMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  cfsRateMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  dieselMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  dieselMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  dieselMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  locationMasterFull?: boolean;


  @property({
    type: 'boolean',
  })
  locationMasterRead?: boolean;


  @property({
    type: 'boolean',
  })
  locationMasterWrite?: boolean;


  @property({
    type: 'boolean',
  })
  mileageMasterFull?: boolean;


  @property({
    type: 'boolean',
  })
  mileageMasterWrite?: boolean;


  @property({
    type: 'boolean',
  })
  mileageMasterRead?: boolean;


  @property({
    type: 'boolean',
  })
  portMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  portMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  portMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  portTerminalMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  portTerminalMasterRead?: boolean;


  @property({
    type: 'boolean',
  })
  portTerminalMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  stateMasterFull?: boolean;


  @property({
    type: 'boolean',
  })
  stateMasterRead?: boolean;


  @property({
    type: 'boolean',
  })
  stateMasterWrite?: boolean;


  @property({
    type: 'boolean',
  })
  weightMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  weightMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  weightMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  yardMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  yardMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  yardMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  yardPortMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  yardPortMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  yardPortMasterWrite?: boolean;


  @property({
    type: 'boolean',
  })
  yardCFSRateMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  yardCFSRateMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  yardCFSRateMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  zoneMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  zoneMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  zoneMasterWrite?: boolean;

  @property({
    type: 'boolean',
  })
  zoneDayMasterFull?: boolean;

  @property({
    type: 'boolean',
  })
  zoneDayMasterRead?: boolean;

  @property({
    type: 'boolean',
  })
  zoneDayMasterWrite?: boolean;

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
    type: 'boolean',
  })
  isActive?: boolean;


  constructor(data?: Partial<Permission>) {
    super(data);
  }
}

export interface PermissionRelations {
  // describe navigational properties here
}

export type PermissionWithRelations = Permission & PermissionRelations;
