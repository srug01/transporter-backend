import {securityId} from '@loopback/security';
import {RequestHandler} from 'express-serve-static-core';
import {Permission, Userrolemapping} from './models';

export interface RequiredPermissions {
  required: Permission[];
}

export type FileUploadHandler = RequestHandler;
export interface MyUserProfile {
  [securityId]: string;
  userId: string;
  email?: string;
  name: string;
  typeSyscode: number;
  permissions: string[];
  roles: Userrolemapping[];
}
