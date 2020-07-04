import {authenticate} from '@loopback/authentication';
import {inject} from '@loopback/core';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  param,
  patch,
  post,
  put,
  requestBody,
} from '@loopback/rest';
import {toJSON} from '@loopback/testlab';
import {pick} from 'lodash';
import {UserServiceBindings} from '../keys';
import {CfsUserRegistration, User} from '../models';
import {CfsUserRegistrationRepository, UserRepository} from '../repositories';
import {MyUserService} from '../services/user-service';

export class CfsUserRegistrationController {
  constructor(
    @inject(UserServiceBindings.USER_SERVICE)
    public userService: MyUserService,
    @repository(UserRepository)
    public userRepository: UserRepository,
    @repository(CfsUserRegistrationRepository)
    public cfsUserRegistrationRepository: CfsUserRegistrationRepository, // @inject('user') // public user: User,
  ) {}

  @post('/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model instance',
        content: {
          'application/json': {schema: getModelSchemaRef(CfsUserRegistration)},
        },
      },
    },
  })
  @authenticate('jwt')
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {
            title: 'NewCfsUserRegistration',
            exclude: ['cfs_user_registration_syscode'],
          }),
        },
      },
    })
    cfsUserRegistration: Omit<
      CfsUserRegistration,
      'cfs_user_registration_syscode'
    >,
  ): Promise<CfsUserRegistration> {
    //Need to Create a User first.
    let email = '';
    let passwordStr = '';
    let userName = '';
    let mobileNumber = '';
    if (cfsUserRegistration.cfs_user_email) {
      email = cfsUserRegistration.cfs_user_email;
    }
    if (cfsUserRegistration.cfs_user_password) {
      passwordStr = cfsUserRegistration.cfs_user_password;
    }
    if (cfsUserRegistration.cfs_user_name) {
      userName = cfsUserRegistration.cfs_user_name;
    }
    if (cfsUserRegistration.cfs_user_mobile_no) {
      mobileNumber = cfsUserRegistration.cfs_user_mobile_no;
    }
    const createUser: User = pick(toJSON(cfsUserRegistration), [
      'firstName',
      'lastName',
      'mobileNumber',
      'email',
      'password',
      'typeSyscode',
    ]) as User;
    createUser.firstName = cfsUserRegistration.cfs_user_name;
    createUser.email = email;
    createUser.password = passwordStr;
    createUser.typeSyscode = cfsUserRegistration.user_type_syscode;
    createUser.firstName = userName;
    createUser.lastName = userName;
    createUser.mobileNumber = mobileNumber;
    //console.log('User Name' + user.firstName);
    const createdUser = await this.userService.createUser(createUser);
    cfsUserRegistration.userId = createdUser.getId();
    //const createdUser = await this.orderRepository.create(order);
    return this.cfsUserRegistrationRepository.create(cfsUserRegistration);
  }

  @get('/cfs-user-registrations/count', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async count(
    @param.where(CfsUserRegistration) where?: Where<CfsUserRegistration>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.count(where);
  }

  @get('/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'Array of CfsUserRegistration model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(CfsUserRegistration, {
                includeRelations: true,
              }),
            },
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async find(
    @param.filter(CfsUserRegistration) filter?: Filter<CfsUserRegistration>,
  ): Promise<CfsUserRegistration[]> {
    return this.cfsUserRegistrationRepository.find(filter);
  }

  @patch('/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'CfsUserRegistration PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  @authenticate('jwt')
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {partial: true}),
        },
      },
    })
    cfsUserRegistration: CfsUserRegistration,
    @param.where(CfsUserRegistration) where?: Where<CfsUserRegistration>,
  ): Promise<Count> {
    return this.cfsUserRegistrationRepository.updateAll(
      cfsUserRegistration,
      where,
    );
  }

  @get('/cfs-user-registrations/{id}', {
    responses: {
      '200': {
        description: 'CfsUserRegistration model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CfsUserRegistration, {
              includeRelations: true,
            }),
          },
        },
      },
    },
  })
  @authenticate('jwt')
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CfsUserRegistration, {exclude: 'where'})
    filter?: FilterExcludingWhere<CfsUserRegistration>,
  ): Promise<CfsUserRegistration> {
    return this.cfsUserRegistrationRepository.findById(id, filter);
  }

  @patch('/cfs-user-registrations/{id}', {
    responses: {
      '204': {
        description: 'CfsUserRegistration PATCH success',
      },
    },
  })
  @authenticate('jwt')
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {partial: true}),
        },
      },
    })
    cfsUserRegistration: CfsUserRegistration,
  ): Promise<void> {
    await this.cfsUserRegistrationRepository.updateById(
      id,
      cfsUserRegistration,
    );
  }

  @put('/cfs-user-registrations/{id}', {
    responses: {
      '204': {
        description: 'CfsUserRegistration PUT success',
      },
    },
  })
  @authenticate('jwt')
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() cfsUserRegistration: CfsUserRegistration,
  ): Promise<void> {
    await this.cfsUserRegistrationRepository.replaceById(
      id,
      cfsUserRegistration,
    );
  }

  @del('/cfs-user-registrations/{id}', {
    responses: {
      '204': {
        description: 'CfsUserRegistration DELETE success',
      },
    },
  })
  @authenticate('jwt')
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.cfsUserRegistrationRepository.deleteById(id);
  }
}
