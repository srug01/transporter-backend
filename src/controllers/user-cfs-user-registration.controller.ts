import {authenticate} from '@loopback/authentication';
import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where
} from '@loopback/repository';
import {
  del,
  get,
  getModelSchemaRef,
  getWhereSchemaFor,
  param,
  patch,
  post,
  requestBody
} from '@loopback/rest';
import {
  CfsUserRegistration, User
} from '../models';
import {UserRepository} from '../repositories';
@authenticate('jwt')
export class UserCfsUserRegistrationController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/cfs-user-registration', {
    responses: {
      '200': {
        description: 'User has one CfsUserRegistration',
        content: {
          'application/json': {
            schema: getModelSchemaRef(CfsUserRegistration),
          },
        },
      },
    },
  })
  async get(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<CfsUserRegistration>,
  ): Promise<CfsUserRegistration> {
    return this.userRepository.cfsUserRegistration(id).get(filter);
  }

  @post('/users/{id}/cfs-user-registration', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(CfsUserRegistration)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof User.prototype.userId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {
            title: 'NewCfsUserRegistrationInUser',
            exclude: ['cfsUserRegistrationId'],
            optional: ['userId']
          }),
        },
      },
    }) cfsUserRegistration: Omit<CfsUserRegistration, 'cfsUserRegistrationId'>,
  ): Promise<CfsUserRegistration> {
    return this.userRepository.cfsUserRegistration(id).create(cfsUserRegistration);
  }

  @patch('/users/{id}/cfs-user-registration', {
    responses: {
      '200': {
        description: 'User.CfsUserRegistration PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(CfsUserRegistration, {partial: true}),
        },
      },
    })
    cfsUserRegistration: Partial<CfsUserRegistration>,
    @param.query.object('where', getWhereSchemaFor(CfsUserRegistration)) where?: Where<CfsUserRegistration>,
  ): Promise<Count> {
    return this.userRepository.cfsUserRegistration(id).patch(cfsUserRegistration, where);
  }

  @del('/users/{id}/cfs-user-registration', {
    responses: {
      '200': {
        description: 'User.CfsUserRegistration DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(CfsUserRegistration)) where?: Where<CfsUserRegistration>,
  ): Promise<Count> {
    return this.userRepository.cfsUserRegistration(id).delete(where);
  }
}
