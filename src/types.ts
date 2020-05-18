import {securityId} from '@loopback/security';
import {PermissionKeys} from './authorization/permission-keys';
export interface RequiredPermissions {
    required: PermissionKeys[];
}

export interface MyUserProfile {
    [securityId]: string;
    id: string;
    email?: string;
    name: string;
    permissions: PermissionKeys[];
}
