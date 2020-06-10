import {UserService} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {repository} from '@loopback/repository';
import {HttpErrors} from '@loopback/rest';
import {toJSON} from '@loopback/testlab';
import {pick} from 'lodash';
import {PasswordHasherBindings} from '../keys';
import {User} from '../models';
import {Credentials, UserRepository} from '../repositories/user.repository';
import {MyUserProfile} from '../types';
import {BcryptHasher} from './hash.password.bcrypt';

export class MyUserService implements UserService<User, Credentials> {
  constructor(
    @repository(UserRepository)
    public userRepository: UserRepository,
    @inject(PasswordHasherBindings.PASSWORD_HASHER)
    public hasher: BcryptHasher,
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
}
