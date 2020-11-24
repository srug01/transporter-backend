import {inject} from '@loopback/core';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  HttpErrors,
  param,
  patch,
  post,
  put,
  requestBody
} from '@loopback/rest';
import {toJSON} from '@loopback/testlab';
import {pick} from 'lodash';
import {UserServiceBindings} from '../keys';
import {CfsUserRegistration, Paymenthistory, Paymentreceived, Payments, User} from '../models';
import {CfsUserRegistrationRepository, UserRepository, UserroleRepository} from '../repositories';
import {MyUserService} from '../services/user-service';

export class CfsUserRegistrationController {
  constructor(
    @inject(UserServiceBindings.USER_SERVICE)
    public userService: MyUserService,
    @repository(UserRepository)
    public userRepository: UserRepository,
    @repository(CfsUserRegistrationRepository)
    public cfsUserRegistrationRepository: CfsUserRegistrationRepository,
    @repository(UserroleRepository)
    public roleRepository: UserroleRepository,
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
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {
            title: 'NewCfsUserRegistration',
            exclude: ['cfsUserRegistrationId'],
          }),
        },
      },
    })
    cfsUserRegistration: Omit<CfsUserRegistration, 'cfsUserRegistrationId'>,
  ): Promise<CfsUserRegistration> {
    //Need to Create a User first.
    let email = '';
    let passwordStr = '';
    let userName = '';
    let mobileNumber = '';
    if (cfsUserRegistration.cfsUserEmail) {
      email = cfsUserRegistration.cfsUserEmail;
    }
    if (cfsUserRegistration.cfsUserPassword) {
      passwordStr = cfsUserRegistration.cfsUserPassword;
    }
    if (cfsUserRegistration.cfsUserName) {
      userName = cfsUserRegistration.cfsUserName;
    }
    if (cfsUserRegistration.cfsUserMobileNumber) {
      mobileNumber = cfsUserRegistration.cfsUserMobileNumber;
    }
    const createUser: User = pick(toJSON(cfsUserRegistration), [
      'firstName',
      'lastName',
      'mobileNumber',
      'email',
      'password',
      'typeSyscode',
    ]) as User;
    createUser.firstName = cfsUserRegistration.cfsUserName;
    createUser.email = email;
    createUser.password = passwordStr;
    createUser.typeSyscode = cfsUserRegistration.userTypeId;
    createUser.firstName = userName;
    createUser.lastName = userName;
    createUser.mobileNumber = mobileNumber;
    //console.log('User Name' + user.firstName);
    const createdUser = await this.userService.createUser(createUser);
    cfsUserRegistration.userId = createdUser.getId();
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
  async find(
    @param.filter(CfsUserRegistration) filter?: Filter<CfsUserRegistration>,
  ): Promise<CfsUserRegistration[]> {
    const users = await this.cfsUserRegistrationRepository.find(filter);
    for (const user of users) {
      const userRole = await this.roleRepository.findById(user.userTypeId);
      user.roleName = userRole.roleName;
    }
    return users;
  }

  @patch('/cfs-user-registrations', {
    responses: {
      '200': {
        description: 'CfsUserRegistration PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
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
  async findById(
    @param.path.number('id') id: number,
    @param.filter(CfsUserRegistration, {exclude: 'where'})
    filter?: FilterExcludingWhere<CfsUserRegistration>,
  ): Promise<CfsUserRegistration> {
    return this.cfsUserRegistrationRepository.findById(id, filter);
  }

  @get('/cfs-user-registrationsbyUserId/{id}', {
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
  async findbyUserId(
    @param.path.number('id') id: number,
    @param.query.object('filter') paymentfilter?: Filter<Payments>,
    @param.query.object('filter') paymentrecievedfilter?: Filter<Paymentreceived>,
    @param.query.object('filter') paymentHistoryfilter?: Filter<Paymenthistory>,
      ): Promise<CfsUserRegistration> {
    const cfsUser = await this.cfsUserRegistrationRepository.find({where: {userId: id}});
    if(cfsUser.length > 0)
    {
      cfsUser[0].payments = await this.cfsUserRegistrationRepository.payments(id).find(paymentfilter);
      cfsUser[0].paymentsReceived = await this.cfsUserRegistrationRepository.paymentsReceived(id).find(paymentrecievedfilter);
      cfsUser[0].paymenthistories = await this.cfsUserRegistrationRepository.paymenthistories(id).find(paymentHistoryfilter);
    }
    else
    {
    throw new HttpErrors.UnprocessableEntity('Entity Not Found');
    }
    return cfsUser[0];
  }





  @patch('/cfs-user-registrations/{id}', {
    responses: {
      '204': {
        description: 'CfsUserRegistration PATCH success',
      },
    },
  })
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
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.cfsUserRegistrationRepository.deleteById(id);
  }
}
