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
  User,
  Userrolemapping
} from '../models';
import {UserRepository} from '../repositories';
@authenticate('jwt')
export class UserUserrolemappingController {
  constructor(
    @repository(UserRepository) protected userRepository: UserRepository,
  ) { }

  @get('/users/{id}/userrolemappings', {
    responses: {
      '200': {
        description: 'Array of User has many Userrolemapping',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Userrolemapping)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<Userrolemapping>,
  ): Promise<Userrolemapping[]> {
    return this.userRepository.userrolemappings(id).find(filter);
  }

  @post('/users/{id}/userrolemappings', {
    responses: {
      '200': {
        description: 'User model instance',
        content: {'application/json': {schema: getModelSchemaRef(Userrolemapping)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof User.prototype.userId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userrolemapping, {
            title: 'NewUserrolemappingInUser',
            exclude: ['userroleId'],
            optional: ['userId']
          }),
        },
      },
    }) userrolemapping: Omit<Userrolemapping, 'userroleId'>,
  ): Promise<Userrolemapping> {
    return this.userRepository.userrolemappings(id).create(userrolemapping);
  }

  @patch('/users/{id}/userrolemappings', {
    responses: {
      '200': {
        description: 'User.Userrolemapping PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Userrolemapping, {partial: true}),
        },
      },
    })
    userrolemapping: Partial<Userrolemapping>,
    @param.query.object('where', getWhereSchemaFor(Userrolemapping)) where?: Where<Userrolemapping>,
  ): Promise<Count> {
    return this.userRepository.userrolemappings(id).patch(userrolemapping, where);
  }

  @del('/users/{id}/userrolemappings', {
    responses: {
      '200': {
        description: 'User.Userrolemapping DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(Userrolemapping)) where?: Where<Userrolemapping>,
  ): Promise<Count> {
    return this.userRepository.userrolemappings(id).delete(where);
  }
}
