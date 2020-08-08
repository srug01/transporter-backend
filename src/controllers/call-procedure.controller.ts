/* eslint-disable @typescript-eslint/no-explicit-any */
import {authenticate} from '@loopback/authentication';
import {inject} from '@loopback/context';
import {param} from '@loopback/openapi-v3';
import {get, getModelSchemaRef, Request, RestBindings} from '@loopback/rest';
import {LocationMaster} from '../models';

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
    '/GetAllCFSWeightsbyUserandContainerId/{userid}/{typeid}/{containerMasterId}',
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
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
  Promise<any> {
    const sqlStmt = mysql.format(
      'CALL GetAllCFSWeightsbyUserandContainerId(?,?,?)',
      [userid, typeid, containerMasterId],
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

  @get('/getAllCFSContainersbyUserId/{userid}/{typeid}', {
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
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
  Promise<any> {
    const sqlStmt = mysql.format('CALL getAllCFSContainersbyUserId(?,?)', [
      userid,
      typeid,
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
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
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
}
