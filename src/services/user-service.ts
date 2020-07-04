import {UserService} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {repository} from '@loopback/repository';
import {HttpErrors} from '@loopback/rest';
import {toJSON} from '@loopback/testlab';
import {pick} from 'lodash';
import {PermissionKeys} from '../authorization/permission-keys';
import {PasswordHasherBindings} from '../keys';
import {User, Userrolemapping} from '../models';
import {Credentials, UserRepository} from '../repositories/user.repository';
import {validateCredentials} from '../services/validator';
import {MyUserProfile} from '../types';
import {BcryptHasher} from './hash.password.bcrypt';

export class MyUserService implements UserService<User, Credentials> {
  constructor(
    @repository(UserRepository)
    public userRepository: UserRepository,
    @inject(PasswordHasherBindings.PASSWORD_HASHER)
    public hasher: BcryptHasher, // public roles: Userrolemapping[],
  ) {}
  async verifyCredentials(credentials: Credentials): Promise<User> {
    //
    const foundUser = await this.userRepository.findOne({
      where: {
        email: credentials.email,
      },
    });
    if (!foundUser) {
      throw new HttpErrors.NotFound(
        `user not found with this ${credentials.email}`,
      );
    }

    const passwordMatched = await this.hasher.comparePassword(
      credentials.password,
      foundUser.password,
    );
    if (!passwordMatched) {
      throw new HttpErrors.Unauthorized('password is not valid');
    }
    return foundUser;
  }

  async UserRoles(id: string): Promise<Userrolemapping[]> {
    //Get User Roles
    const roles = await this.userRepository.userroles(+id).find();
    return roles;
  }

  convertToUserProfile(user: User): MyUserProfile {
    let userName = '';
    let idString = '';
    let userEmail = '';
    let userType = 0;

    if (user.firstName) {
      userName = user.firstName;
    }
    if (user.email) {
      userEmail = user.email;
    }
    if (user.lastName) {
      userName = user.firstName
        ? `${user.firstName} ${user.lastName}`
        : user.lastName;
    }
    if (user.id) {
      idString = user.id.toString();
      // this.roles = this.userRepository.userroles(user.id).find();
    }
    if (user.typeSyscode) {
      userType = user.typeSyscode;
    }

    const currentUser: MyUserProfile = pick(toJSON(user), [
      'id',
      'permissions',
      'email',
      'typeSyscode',
    ]) as MyUserProfile;
    currentUser.name = userName;
    currentUser.email = userEmail;
    currentUser.typeSyscode = userType;
    return currentUser;
  }

  async createUser(userData: User) {
    validateCredentials(pick(userData, ['email', 'password']));
    userData.permissions = [PermissionKeys.AccessAuthFeature];
    //encrypt the user password
    userData.password = await this.hasher.hashPassword(userData.password);

    const savedUser = await this.userRepository.create(userData);
    delete savedUser.password;
    return savedUser;
  }
}
