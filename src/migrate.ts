import {BackendApplication} from './application';

export async function migrate(args: string[]) {
  const existingSchema = args.includes('--rebuild') ? 'drop' : 'alter';
  console.log('Migrating schemas (%s existing schema)', existingSchema);

  const app = new BackendApplication();
  await app.boot();
  await app.migrateSchema({
    existingSchema,
    models: [
      'User',
      'Userrolemapping',
      'Userrole',
      'Bid',
      'Bidusermapping',
      'CfsMaster',
      'CfsRateMaster',
      'CfsUserRegistration',
      'ContainerMaster',
      'Container',
      'DieselRateMaster',
      'Driver',
      'Drivertransportermapping',
      'LocationMaster',
      'MasterType',
      'MileageMaster',
      'Notification',
      'Order',
      'PortMaster',
      'PortTerminalMaster',
      'Settings',
      'StateMaster',
      'SubOrder',
      'Timeslotmaster',
      'TransporterRegistration',
      'Truck',
      'Trip',
      'Vehicle',
      'VehicleMaster',
      'Vehicletransportermapping',
      'WeightMaster',
      'YardCfsRateMaster',
      'YardMaster',
      'ZoneDayMaster',
      'ZoneMaster',
      'Trip',
    ],
  });

  // Connectors usually keep a pool of opened connections,
  // this keeps the process running even after all work is done.
  // We need to exit explicitly.
  process.exit(0);
}

migrate(process.argv).catch(err => {
  console.error('Cannot migrate database schema', err);
  process.exit(1);
});
