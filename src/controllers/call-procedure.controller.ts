/* eslint-disable @typescript-eslint/no-explicit-any */
import {authenticate} from '@loopback/authentication';
import {inject} from '@loopback/context';
import {param} from '@loopback/openapi-v3';
import {get, getModelSchemaRef, Request, RestBindings} from '@loopback/rest';
import {Dashboard, LocationMaster} from '../models';

interface Bid {
  bidName: string;
  bidValue: number;
  biduserStatus: string;
  subOrderTotalMargin: 90;
  suborderStatus: 'SUB_ORDER_PENDING';
}

interface OrderDetails {
  AssignedDriver: string;
  CutOffTime: string;
  TranporterName: string;
  bids: Bid[];
  containerMasterName: string;
  destinationName: string;
  destinationType: string;
  emailid: string;
  mobileNumber: string;
  orderDate: string;
  orderId: number;
  orderRemarks: string;
  orderStatus: string;
  sourceName: string;
  sourceType: string;
  terminal: string;
  totalRate: number;
  tripstatus: string;
  vehicleNumber: string;
  weightDesc: string;
}

const mysql = require('mysql');
const db = require('mysql-promise')();
const mysqlCreds = require('../datasources/test.datasource.config.json');

export class CallProcedureController {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  private connection: any;

  constructor(@inject(RestBindings.Http.REQUEST) private req: Request) {
    db.configure(mysqlCreds, mysql);
    this.connection = db;
  }
  /*  ****** EXAMPLE - 1 ******
  @get('/search', {
    responses: {
      '200': {
        description: 'Search for Products using keyword(s)',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Product)},
          },
        },
      },
    },
  })
  async search(@param.query.string('key') key: string): Promise<Product> {
    const sqlStmt = mysql.format('CALL PRODUCTSEARCH(?)', [key]);

    return new Promise<Product>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  } */

  // for finding CFS Location
  /******* EXAMPLE - 2 ******
   @get('/location')
  async findLocation() {
    const sql = 'select * from [User]';
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    db.connector.query(sql, function (err: any, results: any[]) {
      if (err) {
        throw err;
      } else {
        return results;
      }
    });
  } */

  @get('/searchCFSLocation/{userId}', {
    responses: {
      '200': {
        description: 'Search for LocationMaster using Id',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(LocationMaster)},
          },
        },
      },
    },
  })
  async searchCFSLocation(
    @param.path.string('userId') userId: string,
  ): Promise<LocationMaster> {
    const sqlStmt = mysql.format('CALL SEARCHCFSLOCATION(?)', [userId]);

    return new Promise<LocationMaster>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/MultipleTables/{userid}/{roleid}', {
    responses: {
      '200': {
        description: 'Search for Multiple Tables Join',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async MultipleTables(
    @param.path.string('userid') userid: string,
    @param.path.string('roleid') roleid: string,
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
    Promise<any> {
    const sqlStmt = mysql.format('CALL MULTIPLETABLES(?,?)', [userid, roleid]);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetBidsByUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Bids by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async GetBidsByUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetBidsbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get(
    '/GetAllCFSWeightsbyUserandContainerId/{userid}/{typeid}/{containerMasterId}/{portyardid}',
    {
      responses: {
        '200': {
          description: 'Search for Multiple Tables Join',
          content: {
            'application/json': {
              schema: {type: 'array'},
            },
          },
        },
      },
    },
  )
  @authenticate('jwt')
  async GetAllCFSWeightsbyUserandContainerId(
    @param.path.string('userid') userid: number,
    @param.path.string('typeid') typeid: number,
    @param.path.string('containerMasterId') containerMasterId: number,
    @param.path.string('portyardid') portyardid: number,
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
    Promise<any> {
    const sqlStmt = mysql.format(
      'CALL GetAllCFSWeightsbyUserandContainerId(?,?,?,?)',
      [userid, typeid, containerMasterId, portyardid],
    );

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/getAllCFSContainersbyUserId/{userid}/{typeid}/{portyardid}', {
    responses: {
      '200': {
        description: 'Search for Multiple Tables Join',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async GetAllCFSContainersbyUserId(
    @param.path.string('userid') userid: number,
    @param.path.string('typeid') typeid: number,
    @param.path.string('portyardid') portyardid: number,
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
    Promise<any> {
    const sqlStmt = mysql.format('CALL getAllCFSContainersbyUserId(?,?,?)', [
      userid,
      typeid,
      portyardid,
    ]);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllCFSbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Bids by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async GetAllCFSbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllCFSbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllCFSPortsbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Bids by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async GetAllCFSPortsbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllCFSPortsbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllCFSYardsbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Bids by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async GetAllCFSYardsbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllCFSYardsbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetTripsByUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Trip by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetTripsByUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllTripsbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetTripsbyId/{tripId}', {
    responses: {
      '200': {
        description: 'Search for Trip by  TripId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetTripsbyId(
    @param.path.string('tripId') tripId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetTripsbyId(?)', [tripId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetTripDetailsbyTripId/{tripId}', {
    responses: {
      '200': {
        description: 'Details for Trip by  TripId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetTripDetailsbyTripId(
    @param.path.string('tripId') tripId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetTripDetailsbyTripId(?)', [tripId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllVehiclesbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Vehicles by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetAllVehiclesbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllVehiclesbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllDriversbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Vehicles by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetAllDriversbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllDriversbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetOrderDetailsbyOrderId/{orderId}', {
    responses: {
      '200': {
        description: 'Search for Vehicles by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetOrderDetailsbyOrderId(
    @param.path.string('orderId') orderId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL procGetOrderDetails(?)', [orderId]);
    return new Promise<any>(function (resolve, reject) {
      const order: any = {};
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        order.AssignedDriver = results[0][0].AssignedDriver
          ? results[0][0].AssignedDriver
          : '';
        order.CutOffTime = results[0][0].CutOffTime;
        order.TranporterName = results[0][0].TranporterName;
        order.containerMasterName = results[0][0].containerMasterName;
        order.destinationName = results[0][0].destinationName;
        order.destinationType = results[0][0].destinationType;
        order.emailid = results[0][0].emailid;
        order.mobileNumber = results[0][0].mobileNumber;
        order.orderDate = results[0][0].orderDate;
        order.orderId = results[0][0].orderId;
        order.orderRemarks = results[0][0].orderRemarks;
        order.orderStatus = results[0][0].orderStatus;
        order.sourceName = results[0][0].sourceName;
        order.sourceType = results[0][0].sourceType;
        order.terminal = results[0][0].terminal;
        order.totalRate = results[0][0].totalRate;
        order.tripstatus = results[0][0].tripstatus;
        order.vehicleNumber = results[0][0].vehicleNumber;
        order.weightDesc = results[0][0].weightDesc;
        order.bids = [];
        for (const suborder of results[0]) {
          const obj: Bid = {
            bidName: suborder.bidName,
            bidValue: suborder.bidValue,
            biduserStatus: suborder.biduserStatus,
            subOrderTotalMargin: suborder.subOrderTotalMargin,
            suborderStatus: suborder.suborderStatus,
          };
          order.bids.push(obj);
        }
        resolve(order);
      });
    });
  }

  @get('/GetAllOrdersbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Orders by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetAllOrdersbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllOrdersbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllSubOrdersbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Sub Orders by  UserId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetAllSubOrdersbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllSubOrdersbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAllTransporter', {
    responses: {
      '200': {
        description: 'Search for AllTransporter',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  async GetAllTransporter(): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllTransporter()');
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  @get('/GetAdminDashboardbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for Admin DashBoard',
        content: {
          'application/json': {
            schema: {type: getModelSchemaRef(Dashboard)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetAdminDashboardbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<Dashboard> {
    const sqlStmt = mysql.format('CALL getDashboardForAdmin(?)', [userId]);
    return new Promise<Dashboard>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: Dashboard) {
        if (err !== null) return reject(err);
        const JsonData = JSON.stringify(results);
        const obj = JSON.parse(JsonData);
        const data: Dashboard = new Dashboard();
        data.TotalOrders = obj[0][0].TotalOrders;
        data.TotalSubOrders = obj[1][0].TotalSubOrders;
        data.TotalBids = obj[2][0].TotalBids;
        data.TotalTrips = obj[3][0].TotalTrips;
        data.Orders = obj[4];
        data.SubOrders = obj[5];
        data.Bids = obj[6];
        data.Trips = obj[7];
        resolve(data);
      });
    });
  }

  @get('/GetCFSDashboardbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for CFS DashBoard',
        content: {
          'application/json': {
            schema: {type: getModelSchemaRef(Dashboard)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetCFSDashboardbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<Dashboard> {
    const sqlStmt = mysql.format('CALL getDashboardForCFS(?)', [userId]);
    return new Promise<Dashboard>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: Dashboard) {
        if (err !== null) return reject(err);
        const JsonData = JSON.stringify(results);
        const obj = JSON.parse(JsonData);
        const data: Dashboard = new Dashboard();
        data.TotalOrders = obj[0][0].TotalOrders;
        data.TotalTrips = obj[1][0].TotalTrips;
        data.Orders = obj[2];
        data.Trips = obj[3];
        resolve(data);
      });
    });
  }

  @get('/GetTransporterDashboardbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for CFS DashBoard',
        content: {
          'application/json': {
            schema: {type: getModelSchemaRef(Dashboard)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetTransporterDashboardbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<Dashboard> {
    const sqlStmt = mysql.format('CALL getDashboardForTransporter(?)', [
      userId,
    ]);
    return new Promise<Dashboard>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: Dashboard) {
        if (err !== null) return reject(err);
        const JsonData = JSON.stringify(results);
        const obj = JSON.parse(JsonData);
        const data: Dashboard = new Dashboard();
        data.TotalSubOrders = obj[0][0].TotalSubOrders;
        data.TotalBids = obj[1][0].TotalBids;
        data.TotalTrips = obj[2][0].TotalTrips;
        data.SubOrders = obj[3];
        data.Bids = obj[4];
        data.Trips = obj[5];
        resolve(data);
      });
    });
  }

  @get('/GetDriverDashboardbyUserId/{userId}', {
    responses: {
      '200': {
        description: 'Search for CFS DashBoard',
        content: {
          'application/json': {
            schema: {type: getModelSchemaRef(Dashboard)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async GetDriverDashboardbyUserId(
    @param.path.string('userId') userId: string,
  ): Promise<Dashboard> {
    const sqlStmt = mysql.format('CALL getDashboardForDriver(?)', [userId]);
    return new Promise<Dashboard>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: Dashboard) {
        if (err !== null) return reject(err);
        const JsonData = JSON.stringify(results);
        const obj = JSON.parse(JsonData);
        const data: Dashboard = new Dashboard();
        data.TotalTrips = obj[0][0].TotalTrips;
        data.Trips = obj[1];
        resolve(data);
      });
    });
  }
}
