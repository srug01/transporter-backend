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
import {Driver, Drivertransportermapping, User} from '../models';
import {
  DriverRepository,
  DrivertransportermappingRepository,
  UserRepository,
} from '../repositories';
import {MyUserService} from '../services/user-service';

export class DriversController {
  constructor(
    @repository(DriverRepository)
    public driverRepository: DriverRepository,
    @repository(DrivertransportermappingRepository)
    public drivertransportermappingRepository: DrivertransportermappingRepository,
    @repository(UserRepository)
    public userRepository: UserRepository,
    @inject(UserServiceBindings.USER_SERVICE)
    public userService: MyUserService,
  ) {}

  @post('/drivers', {
    responses: {
      '200': {
        description: 'Driver model instance',
        content: {'application/json': {schema: getModelSchemaRef(Driver)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Driver, {
            title: 'NewDriver',
            exclude: ['driverId'],
          }),
        },
      },
    })
    driver: Omit<Driver, 'driverId'>,
  ): Promise<Driver> {
    // Create User First
    let email = '';
    let passwordStr = '';
    let firstName = '';
    let lastName = '';
    let mobileNumber = '';
    if (driver.emailId) {
      email = driver.emailId;
    }
    if (driver.userPassword) {
      passwordStr = driver.userPassword;
    }
    if (driver.firstname) {
      firstName = driver.firstname;
    }
    if (driver.lastname) {
      lastName = driver.lastname;
    }
    if (driver.mobileNumber) {
      mobileNumber = driver.mobileNumber;
    }

    const createUser: User = pick(toJSON(driver), [
      'firstName',
      'lastName',
      'mobileNumber',
      'email',
      'password',
      'typeSyscode',
    ]) as User;
    createUser.email = email;
    createUser.password = passwordStr;
    createUser.typeSyscode = 6;
    createUser.firstName = firstName;
    createUser.lastName = lastName;
    createUser.mobileNumber = mobileNumber;
    console.log('User Name' + firstName);
    const createdUser = await this.userService.createUser(createUser);
    const userId = createdUser.getId();
    console.log(userId);
    const createdDriver = await this.driverRepository.create(driver);
    const createmap: Drivertransportermapping = pick(toJSON(driver), [
      'createdBy',
      'createdOn',
    ]) as Drivertransportermapping;
    createmap.driverId = userId;
    createmap.userId = createdDriver?.createdBy ?? 0;
    const mapping = await this.drivertransportermappingRepository.create(
      createmap,
    );
    return createdDriver;
    //return this.driverRepository.create(driver);
  }

  @get('/drivers/count', {
    responses: {
      '200': {
        description: 'Driver model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(@param.where(Driver) where?: Where<Driver>): Promise<Count> {
    return this.driverRepository.count(where);
  }

  @get('/drivers', {
    responses: {
      '200': {
        description: 'Array of Driver model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(Driver, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(@param.filter(Driver) filter?: Filter<Driver>): Promise<Driver[]> {
    return this.driverRepository.find(filter);
  }

  @patch('/drivers', {
    responses: {
      '200': {
        description: 'Driver PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Driver, {partial: true}),
        },
      },
    })
    driver: Driver,
    @param.where(Driver) where?: Where<Driver>,
  ): Promise<Count> {
    return this.driverRepository.updateAll(driver, where);
  }

  @get('/drivers/{id}', {
    responses: {
      '200': {
        description: 'Driver model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(Driver, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(Driver, {exclude: 'where'})
    filter?: FilterExcludingWhere<Driver>,
  ): Promise<Driver> {
    return this.driverRepository.findById(id, filter);
  }

  @patch('/drivers/{id}', {
    responses: {
      '204': {
        description: 'Driver PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Driver, {partial: true}),
        },
      },
    })
    driver: Driver,
  ): Promise<void> {
    await this.driverRepository.updateById(id, driver);
  }

  @put('/drivers/{id}', {
    responses: {
      '204': {
        description: 'Driver PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() driver: Driver,
  ): Promise<void> {
    await this.driverRepository.replaceById(id, driver);
  }

  @del('/drivers/{id}', {
    responses: {
      '204': {
        description: 'Driver DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.driverRepository.deleteById(id);
  }
}
