import {getJsonSchemaRef, post, requestBody} from '@loopback/rest';
import {User} from '../models';
import {validateCredentials} from '../services/validator';
import {repository} from '@loopback/repository';
import {UserRepository} from '../repositories';
import {PasswordHasherBindings} from '../keys';
import {inject} from '@loopback/core';
import {BcryptHasher} from '../services/hash.password.bcrypt';
import * as _ from 'lodash';
import {PermissionKeys} from '../authorization/permission-keys';

// Uncomment these imports to begin using these cool features!

// import {inject} from '@loopback/context';

export class AdminController {
  constructor(
    @repository(UserRepository)
    public userRepository: UserRepository,
    @inject(PasswordHasherBindings.PASSWORD_HASHER)
    public hasher: BcryptHasher,
  ) {}

  @post('/admin', {
    responses: {
      '200': {
        description: 'Admin',
        content: {
          schema: getJsonSchemaRef(User),
        },
      },
    },
  })
  async create(@requestBody() admin: User) {
    validateCredentials(_.pick(admin, ['email', 'password']));
    admin.permissions = [
      PermissionKeys.CreateVehicle,
      PermissionKeys.UpdateVehicle,
      PermissionKeys.DeleteVehicle,
    ];
    //encrypt the user password
    // eslint-disable-next-line require-atomic-updates
    admin.password = await this.hasher.hashPassword(admin.password);

    const savedAdmin = await this.userRepository.create(admin);
    delete savedAdmin.password;
    return savedAdmin;
  }
}
