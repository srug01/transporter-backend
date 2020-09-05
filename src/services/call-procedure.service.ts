/* eslint-disable @typescript-eslint/no-explicit-any */
import {inject} from '@loopback/context';
import {repository} from '@loopback/repository';
import {Request, RestBindings} from '@loopback/rest';
import {UserRepository} from '../repositories';
const mysql = require('mysql');
const db = require('mysql-promise')();
const mysqlCreds = require('../datasources/test.datasource.config.json');

//@bind({scope: BindingScope.TRANSIENT})
export class CallProcedureService {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  public connection: any;
  constructor(
    @repository(UserRepository) public userRepository: UserRepository,
    @inject(RestBindings.Http.REQUEST) private req: Request,
  ) {
    db.configure(mysqlCreds, mysql);
    this.connection = db;
  }

  /*
   * Add service methods here
   */

  async PostOrderProcessing(
    id: string,
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
  Promise<any> {
    const sqlStmt = mysql.format('CALL subOrderProcessing(?)', [id]);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  async GetBidsbyUserId(
    id: string,
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
  Promise<any> {
    const sqlStmt = mysql.format('CALL GetBidsbyUserId(?)', [id]);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  async GetAllPermissionsbyUserId(
    id: string,
  ): // eslint-disable-next-line @typescript-eslint/no-explicit-any
  Promise<any> {
    const user: any = await this.userRepository.findById(parseInt(id));
    const sqlStmt = mysql.format('CALL GetAllPermissionsbyUserId(?)', [
      user.typeSyscode,
    ]);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results);
      });
    });
  }
  async GetAllOrdersbyUserId(userId: string): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllOrdersbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  async GetAllSubOrdersbyUserId(userId: string): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllSubOrdersbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }

  async GetTripsByUserId(userId: string): Promise<any> {
    const sqlStmt = mysql.format('CALL GetAllTripsbyUserId(?)', [userId]);
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }
}
