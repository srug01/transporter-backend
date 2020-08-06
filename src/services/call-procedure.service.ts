import {inject} from '@loopback/context';
import {Request, RestBindings} from '@loopback/rest';
const mysql = require('mysql');
const db = require('mysql-promise')();
const mysqlCreds = require('../datasources/test.datasource.config.json');

//@bind({scope: BindingScope.TRANSIENT})
export class CallProcedureService {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  private connection: any;
  constructor(@inject(RestBindings.Http.REQUEST) private req: Request) {
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
    const sqlStmt = mysql.format('CALL GetAllPermissionsbyUserId(?)', [id]);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    return new Promise<any>(function (resolve, reject) {
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      db.query(sqlStmt, function (err: any, results: any) {
        if (err !== null) return reject(err);
        resolve(results[0]);
      });
    });
  }
}
