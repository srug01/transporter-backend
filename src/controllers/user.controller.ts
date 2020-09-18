import {authenticate, AuthenticationBindings} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {Filter, FilterExcludingWhere, repository} from '@loopback/repository';
import {
  get,
  getJsonSchemaRef,
  getModelSchemaRef,
  param,
  post,
  requestBody,
} from '@loopback/rest';
import {UserProfile} from '@loopback/security';
import * as _ from 'lodash';
import {PermissionKeys} from '../authorization/permission-keys';
import {
  CallProcedureServiceBindings,
  PasswordHasherBindings,
  TokenServiceBindings,
  UserServiceBindings,
} from '../keys';
import {User} from '../models';
import {UserRepository} from '../repositories';
import {Credentials} from '../repositories/user.repository';
import {BcryptHasher} from '../services/hash.password.bcrypt';
import {JWTService} from '../services/jwt-service';
import {MyUserService} from '../services/user-service';
import {validateCredentials} from '../services/validator';
import {MyUserProfile} from '../types';
import {CallProcedureService} from './../services/call-procedure.service';
import {CredentialsRequestBody} from './specs/user.controller.spec';
// Uncomment these imports to begin using these cool features!

// import {inject} from '@loopback/context';

export class UserController {
  constructor(
    @repository(UserRepository)
    public userRepository: UserRepository,
    @inject(PasswordHasherBindings.PASSWORD_HASHER)
    public hasher: BcryptHasher,
    @inject(UserServiceBindings.USER_SERVICE)
    public userService: MyUserService,
    @inject(TokenServiceBindings.TOKEN_SERVICE)
    public jwtService: JWTService,
    @inject(CallProcedureServiceBindings.CALL_PROCEDURE_SERVICE)
    public _callProcedureService: CallProcedureService,
  ) {}

  @get('/users', {
    responses: {
      '200': {
        description: 'Array of User model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(User, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(@param.filter(User) filter?: Filter<User>): Promise<User[]> {
    return this.userRepository.find(filter);
  }

  @post('/users/signup', {
    responses: {
      '200': {
        description: 'User',
        content: {
          schema: getJsonSchemaRef(User),
        },
      },
    },
  })
  async signup(@requestBody() userData: User) {
    validateCredentials(_.pick(userData, ['email', 'password', 'typeSyscode']));
    userData.permissions = [PermissionKeys.AccessAuthFeature];
    //encrypt the user password
    userData.password = await this.hasher.hashPassword(userData.password);

    const savedUser = await this.userRepository.create(userData);
    delete savedUser.password;
    return savedUser;
  }

  @post('/users/login', {
    responses: {
      '200': {
        description: 'Token',
        content: {
          'application/json': {
            schema: {
              type: 'object',
              properties: {
                token: {
                  type: 'string',
                },
              },
            },
          },
        },
      },
    },
  })
  async login(
    @requestBody(CredentialsRequestBody) credentials: Credentials,
  ): Promise<{token: string; userProfile: UserProfile}> {
    // make sure user exist, password should be valid
    const user = await this.userService.verifyCredentials(credentials);

    //console.log(user);
    const userProfile = this.userService.convertToUserProfile(user);
    //console.log(userProfile);
    // get user roles
    userProfile.roles = await this.userService.UserRoles(userProfile.userId);

    // get user permissions
    const permissionsVal = await this._callProcedureService.GetAllPermissionsbyUserId(
      userProfile.userId,
    );

    const JsonData = JSON.stringify(permissionsVal);
    const obj = JSON.parse(JsonData);
    const permission: string = obj[0][0].Permissions;

    // const resultFromDb = Object.values(permissionsVal)[0];
    // const dataJson = JSON.stringify(resultFromDb);
    // const dataJson = JSON.stringify(permissionsVal);
    const arr: string[] = permission ? permission.split(',') : [];
    // console.log(arr);
    // console.log(permissionsVal[0]);
    userProfile.permissions = arr;

    //generate a json web token
    const token = await this.jwtService.generateToken(userProfile);
    return Promise.resolve({token, userProfile});
  }

  @get('/users/me')
  @authenticate('jwt')
  async me(
    @inject(AuthenticationBindings.CURRENT_USER)
    currentUser: MyUserProfile,
  ): Promise<MyUserProfile> {
    const permissionsVal = await this._callProcedureService.GetAllPermissionsbyUserId(
      currentUser.userId,
    );
    const JsonData = JSON.stringify(permissionsVal);
    const obj = JSON.parse(JsonData);
    const permission: string = obj[0][0].Permissions;
    // console.log(permission);
    const arr: string[] = permission ? permission.split(',') : [];
    currentUser.permissions = arr;
    return Promise.resolve(currentUser);
  }

  @get('/users/{id}', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(User, {includeRelations: true}),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(User, {exclude: 'where'})
    filter?: FilterExcludingWhere<User>,
  ): Promise<User> {
    return this.userRepository.findById(id, filter);
  }
}
