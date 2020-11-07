/* eslint-disable @typescript-eslint/no-explicit-any */
import {authenticate} from '@loopback/authentication';
import {inject} from '@loopback/context';
import {param} from '@loopback/openapi-v3';
import {AnyObject} from '@loopback/repository';
import {
  get,
  getModelSchemaRef,
  HttpErrors,
  post,
  Request,
  requestBody,
  RestBindings
} from '@loopback/rest';
import {CallProcedureServiceBindings} from '../keys';
import {
  BatchFilter,
  BidFilter,
  BidRate,
  CutOff,
  Dashboard,

  LocationMaster,
  OrderFilter,

  SubOrderFilter,
  ThreeparamObj,
  TripFilter
} from '../models';
import {CallProcedureService} from './../services/call-procedure.service';


interface Trip{
  subOrderId: number,
  tripstatus: string,
  startDate: string,
  endDate: string,
  billedAmount: number,
  DriverName: string,
  vehicleNumber: string,
  tripId: number,
  TransporterName: string,
  OrderContainer: string,
  Orderweight:string,
}

interface Bid {
  bidSeq: string,
  exhibitionDate: string,
  subOrderId: number,
  bidValue: number,
  biduserStatus: string,
  originalRate: number
}

interface SubOrder {
  orderId: number,
  subOrderId: number,
  subOrderSeq: string,
  subOrderTotalMargin: number,
  suborderStatus: string,
  containerMasterName: string,
  weightDesc: string,
  SubOrderDate: string,
  bids: Bid[],
  trip: Trip

}

interface OrderDetails {
  orderId: number,
  Source: string,
  Destination: string,
  Remarks: string,
  OrderDate: string,
  OrderTotal: number,
  orderStatus: string,
  subOrders: SubOrder[],

}

const mysql = require('mysql');
// const db = require('mysql-promise')({multipleStatements: true});
const mysqlCreds = require('../datasources/test.datasource.config.json');

export class CallProcedureController {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  public connection: any;

  constructor(
    @inject(RestBindings.Http.REQUEST) private req: Request,
    @inject(CallProcedureServiceBindings.CALL_PROCEDURE_SERVICE)
    public _callProcedureService: CallProcedureService,
  ) {
    // db.configure(mysqlCreds, mysql);
    // this.connection = mysql.createConnection(mysqlCreds);
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<LocationMaster>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @get('/GetBidsforBidding/{userId}', {
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
  async GetBidsforBidding(
    @param.path.string('userId') userId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetBidsforBidding(?)', [userId]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const trips = await this._callProcedureService.GetTripsByUserId(userId);
    return trips;
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>( (resolve, reject) => {
      const order: any = {};
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, async  (err: any, results: any) => {
        if (err !== null) return reject(err);
        // console.log('Result : ' + results[0].length);
        if (results[0].length > 0) {

          order.orderId = results[0][0].orderId;
          order.sourceType = results[0][0].sourceType;
          order.destinationType = results[0][0].destinationType;
          order.sourceName = results[0][0].sourceName;
          order.destinationName = results[0][0].destinationName;
          order.terminal = results[0][0].terminal
          ? results[0][0].terminal
          : '';
          order.orderRemarks = results[0][0].orderRemarks
          ? results[0][0].orderRemarks
          : '';
          order.orderDate = results[0][0].orderDate;
          order.totalRate = results[0][0].totalRate;
          order.CutOffTime = results[0][0].CutOffTime;

          const subOrd:SubOrder[] = [];

          const subOrders = await this._callProcedureService.GetSubOrdersByOrderId(order.orderId);
           for (const suborder of subOrders) {

            const subbids: Bid[] = [];
            const subordbids = await this._callProcedureService.GetBidsBySubOrderId(suborder.subOrderId);
            for (const b of subordbids)
            {
              const bidObj: Bid = {
                bidSeq: b.bidSeq,
                exhibitionDate: b.exhibitionDate,
                subOrderId: b.subOrderId,
                bidValue: b.bidValue,
                biduserStatus: b.biduserStatus,
                originalRate: b.originalRate
              };
              subbids.push(bidObj);
            }
            const tripObj =  await this._callProcedureService.GetTripBySubOrderId(suborder.subOrderId);
            const subobj: SubOrder = {
              orderId: suborder.orderId,
              subOrderId: suborder.subOrderId,
              subOrderSeq: suborder.subOrderSeq,
              subOrderTotalMargin: suborder.subOrderTotalMargin,
              suborderStatus: suborder.suborderStatus,
              containerMasterName: suborder.containerMasterName,
              weightDesc: suborder.weightDesc,
              SubOrderDate: suborder.SubOrderDate,
              bids: subbids,
              trip:tripObj
            };
            subOrd.push(subobj);
          }
          order.subOrders = subOrd;


          /* for (const suborder of results[0]) {
            const obj: Bid = {
              bidName: suborder.bidName,
              bidValue: suborder.bidValue,
              biduserStatus: suborder.biduserStatus,
              originalRate: suborder.subOrderTotalMargin,
            };
            order.bids.push(obj);
          }*/
        }
        resolve(order);
        connection.end();
      });
    });
  }

  /* @get('/GetAllOrdersbyUserId/{userId}', {
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
  }*/

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
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  /* @get('/GetAdminDashboardbyUserId/{userId}', {
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
  } */

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
    const data: Dashboard = new Dashboard();
    const orders = await this._callProcedureService.GetAllOrdersbyUserId(
      userId,
    );
    const suborders = await this._callProcedureService.GetAllSubOrdersbyUserId(
      userId,
    );
    const bids = await this._callProcedureService.GetBidsbyUserId(userId);
    const trips = await this._callProcedureService.GetTripsByUserId(userId);

    data.Orders = orders;
    data.TotalOrders = orders ? orders.length : 0;
    data.SubOrders = suborders;
    data.TotalSubOrders = suborders ? suborders.length : 0;
    data.Bids = bids;
    data.TotalBids = bids ? bids.length : 0;
    data.Trips = trips;
    data.TotalTrips = trips ? trips.length : 0;

    return data;
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
    const data: Dashboard = new Dashboard();
    const orders = await this._callProcedureService.GetAllOrdersbyUserId(
      userId,
    );
    const trips = await this._callProcedureService.GetTripsByUserId(userId);

    data.Orders = orders;
    data.TotalOrders = orders ? orders.length : 0;
    data.Trips = trips;
    data.TotalTrips = trips ? trips.length : 0;
    return data;
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
    const data: Dashboard = new Dashboard();
    const suborders = await this._callProcedureService.GetAllSubOrdersbyUserId(
      userId,
    );
    const bids = await this._callProcedureService.GetBidsbyUserId(userId);
    const trips = await this._callProcedureService.GetTripsByUserId(userId);

    data.SubOrders = suborders;
    data.TotalSubOrders = suborders ? suborders.length : 0;
    data.Bids = bids;
    data.TotalBids = bids ? bids.length : 0;
    data.Trips = trips;
    data.TotalTrips = trips ? trips.length : 0;
    return data;
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
    const data: Dashboard = new Dashboard();
    const trips = await this._callProcedureService.GetTripsByUserId(userId);
    data.Trips = trips;
    data.TotalTrips = trips ? trips.length : 0;
    return data;
  }

  @get('/repTreeViewOrder', {
    responses: {
      '200': {
        description: 'Order Tree View',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async repTreeViewOrder(
    // @param.path.string('userId') userId: string,
  ): Promise<any> {

    // repTreeViewOrder for all Orders
    // getSubOrdersbyOrderId for all SubOrders of an order
    // getbidsbySubOrderId for all bids
    // getTripbySubOrderId for Trip of a SubOrder
    const sqlStmt = mysql.format('CALL repTreeViewOrder()');
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>( (resolve, reject) => {
      const ordObj: OrderDetails[] = [];
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, async  (err: any, results: any) => {
        if (err !== null) return reject(err);
        // console.log('Called' + JSON.stringify(results[0]));
        if (results[0].length > 0) {
          for (const ord of results[0]) {
            const subOrd:SubOrder[] = [];

          const subOrders = await this._callProcedureService.GetSubOrdersByOrderId(ord.orderId);
           for (const suborder of subOrders) {
            const subbids: Bid[] = [];

            const subordbids = await this._callProcedureService.GetBidsBySubOrderId(suborder.subOrderId);
            for (const b of subordbids)
            {
              const bidObj: Bid = {
                bidSeq: b.bidSeq,
                exhibitionDate: b.exhibitionDate,
                subOrderId: b.subOrderId,
                bidValue: b.bidValue,
                biduserStatus: b.biduserStatus,
                originalRate: b.originalRate
              };
              subbids.push(bidObj);
            }
            const tripObj =  await this._callProcedureService.GetTripBySubOrderId(suborder.subOrderId);
            const subobj: SubOrder = {
              orderId: suborder.orderId,
              subOrderId: suborder.subOrderId,
              subOrderSeq: suborder.subOrderSeq,
              subOrderTotalMargin: suborder.subOrderTotalMargin,
              suborderStatus: suborder.suborderStatus,
              containerMasterName: suborder.containerMasterName,
              weightDesc: suborder.weightDesc,
              SubOrderDate: suborder.SubOrderDate,
              bids: subbids,
              trip:tripObj
            };
            subOrd.push(subobj);
          }


          const orddetail:OrderDetails = {
            orderId: ord.orderId,
            Source: ord.Source,
            Destination: ord.Destination,
            Remarks: ord.Remarks,
            OrderDate: ord.OrderDate,
            OrderTotal: ord.OrderTotal,
            orderStatus: ord.orderStatus,
            subOrders: subOrd
          }

          ordObj.push(orddetail);

        }

      }
        resolve(ordObj);
        connection.end();
      });
    });
  }

  @post('/GetOrderListForFilters', {
    responses: {
      '200': {
        description: 'Search for Order List',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(OrderFilter)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async getOrderListForFilters(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(OrderFilter, {
            title: 'OrderFilter',
          }),
        },
      },
    })
    queryObj: OrderFilter,
  ): Promise<AnyObject> {
    const sqlStmt = mysql.format(
      'CALL getOrderListForFilters(?,?,?,?,?,?,?,?)',
      [
        queryObj.sourceId === 0 ? null : queryObj.sourceId,
        queryObj.destinationId === 0 ? null : queryObj.destinationId,
        queryObj.fromDate,
        queryObj.toDate,
        queryObj.orderType === 0 ? null : queryObj.orderType,
        queryObj.orderStatus === 0 ? null : queryObj.orderStatus,
        queryObj.custId === 0 ? null : queryObj.custId,
        queryObj.currentUserId,
      ],
    );
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/GetSubOrderListForFilters', {
    responses: {
      '200': {
        description: 'Search for Sub Order List',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(SubOrderFilter)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async getSubOrderListForFilters(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(SubOrderFilter, {
            title: 'SubOrderFilter',
          }),
        },
      },
    })
    queryObj: SubOrderFilter,
  ): Promise<AnyObject> {
    const sqlStmt = mysql.format(
      'CALL getSubOrderListForFilters(?,?,?,?,?,?)',
      [
        queryObj.orderId === 0 ? null : queryObj.orderId,
        queryObj.cutOffTime,
        queryObj.subOrderDate,
        queryObj.containerType === 0 ? null : queryObj.containerType,
        queryObj.weightType === 0 ? null : queryObj.weightType,
        queryObj.subOrderStatus === 0 ? null : queryObj.subOrderStatus,
      ],
    );
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/GetBidListForFilters', {
    responses: {
      '200': {
        description: 'Search for Bid List',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(BidFilter)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async getBidListForFilters(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BidFilter, {
            title: 'BidFilter',
          }),
        },
      },
    })
    queryObj: BidFilter,
  ): Promise<AnyObject> {
    const sqlStmt = mysql.format('CALL getBidListForFilters(?,?,?)', [
      queryObj.orderId === 0 ? null : queryObj.orderId,
      queryObj.transporterId === 0 ? null : queryObj.transporterId,
      queryObj.bidUserStatusId === 0 ? null : queryObj.bidUserStatusId,
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/GetTripsListForFilters', {
    responses: {
      '200': {
        description: 'Search for Trips List',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(TripFilter)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async getTripsListForFilters(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TripFilter, {
            title: 'TripFilter',
          }),
        },
      },
    })
    queryObj: TripFilter,
  ): Promise<AnyObject> {
    const sqlStmt = mysql.format('CALL getTripsListForFilters(?,?,?,?,?,?)', [
      queryObj.orderId === 0 ? null : queryObj.orderId,
      queryObj.sourceId === 0 ? null : queryObj.sourceId,
      queryObj.destinationId === 0 ? null : queryObj.destinationId,
      queryObj.containerType === 0 ? null : queryObj.containerType,
      queryObj.weightType === 0 ? null : queryObj.weightType,
      queryObj.tripStatus === 0 ? null : queryObj.tripStatus,
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/saveBidforTransporter', {
    responses: {
      '200': {
        description: 'save Bid',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(BidRate)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async saveBidforTransporter(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BidRate, {
            title: 'BidRate',
          }),
        },
      },
    })
    queryObj: BidRate,
  ): Promise<AnyObject> {
    const bidval: number = queryObj?.bidValue ?? 0;
    const lowerLimit: number = queryObj?.bidRate ?? 0;
    if (bidval < lowerLimit) {
      throw new HttpErrors.UnprocessableEntity('Bid Value is too Low');
    }
    const sqlStmt = mysql.format('CALL saveBidforTransporter(?,?,?)', [
      queryObj.suborderId === 0 ? null : queryObj.suborderId,
      queryObj.userId === 0 ? null : queryObj.userId,
      (queryObj.bidValue = bidval),
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @get('/GetAllCFSContainerAndWeights/{masterTypeId}/{cfsMasterId}', {
    responses: {
      '200': {
        description: 'Search for AllContianersAndWeights',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  async GetAllCFSContainerAndWeights(
    @param.path.string('masterTypeId') masterTypeId: string,
    @param.path.string('cfsMasterId') cfsMasterId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllCFSContainerAndWeights(?,?)', [
      masterTypeId,
      cfsMasterId,
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/savePermissionRole', {
    responses: {
      '200': {
        description: 'save Permissions',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(ThreeparamObj)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async savePermissionRole(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(ThreeparamObj, {
            title: 'Filter',
          }),
        },
      },
    })
    queryObj: ThreeparamObj,
  ): Promise<AnyObject> {
    console.log(queryObj);
    const sqlStmt = mysql.format('CALL savePermissionRole(?,?,?)', [
      queryObj.varOne === 0 ? null : queryObj.varOne,
      queryObj.varTwo === 0 ? null : queryObj.varTwo,
      (queryObj.varThree = JSON.stringify(queryObj.varThree)),
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/saveBatchUpdate', {
    responses: {
      '200': {
        description: 'save Batch',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(BatchFilter)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async saveBatchUpdate(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(BatchFilter, {
            title: 'BatchFilter',
          }),
        },
      },
    })
    queryObj: BatchFilter,
  ): Promise<AnyObject> {
    console.log(queryObj);
    const sqlStmt = mysql.format('CALL saveBatchUpdate(?,?,?)', [
      queryObj.masterTypeId === 0 ? null : queryObj.masterTypeId,
      queryObj.isUpdate,
      (queryObj.bulkData = JSON.stringify(queryObj.bulkData)),
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @get('/getPermissionsbyRoleId/{roleId}', {
    responses: {
      '200': {
        description: 'Search for Permissions by  RoleId',
        content: {
          'application/json': {
            schema: {type: 'array'},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async getPermissionsbyRoleId(
    @param.path.string('roleId') roleId: string,
  ): Promise<any> {
    const sqlStmt = mysql.format('CALL getPermissionsbyRoleId(?)', [roleId]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }

  @post('/getCuttOffTimeScheduler', {
    responses: {
      '200': {
        description: 'bid logic check',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(CutOff)},
          },
        },
      },
    },
  })
  // @authenticate('jwt')
  async getCuttOffTimeScheduler(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CutOff, {
            title: 'CutOff',
          }),
        },
      },
    })
    queryObj: CutOff,
  ): Promise<AnyObject> {

    const sqlStmt = mysql.format('CALL procSchedulerConfirmBidForLogicTesting(?,?,?,?,?,?)', [
      queryObj.createdOn,
      queryObj.orderDate,
      queryObj.orderTimeSlot,
      queryObj.runScheduler,
      queryObj.cutOffTime,
      queryObj.cutOffSlot,
    ]);
    const connection = mysql.createConnection(mysqlCreds);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      connection.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
        connection.end();
      });
    });
  }


}
