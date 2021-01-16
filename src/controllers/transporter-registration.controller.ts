import {authenticate} from '@loopback/authentication';
import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where
} from '@loopback/repository';
import {
  del, get,
  getModelSchemaRef, param,


  patch, post,




  put,

  requestBody
} from '@loopback/rest';
import {TransporterRegistration} from '../models';
import {TransporterRegistrationRepository} from '../repositories';
@authenticate('jwt')
export class TransporterRegistrationController {
  constructor(
    @repository(TransporterRegistrationRepository)
    public transporterRegistrationRepository : TransporterRegistrationRepository,
  ) {}

  @post('/transporter-registrations', {
    responses: {
      '200': {
        description: 'TransporterRegistration model instance',
        content: {'application/json': {schema: getModelSchemaRef(TransporterRegistration)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TransporterRegistration, {
            title: 'NewTransporterRegistration',
            exclude: ['transporterId'],
          }),
        },
      },
    })
    transporterRegistration: Omit<TransporterRegistration, 'transporterId'>,
  ): Promise<TransporterRegistration> {
    return this.transporterRegistrationRepository.create(transporterRegistration);
  }

  @get('/transporter-registrations/count', {
    responses: {
      '200': {
        description: 'TransporterRegistration model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(TransporterRegistration) where?: Where<TransporterRegistration>,
  ): Promise<Count> {
    return this.transporterRegistrationRepository.count(where);
  }

  @get('/transporter-registrations', {
    responses: {
      '200': {
        description: 'Array of TransporterRegistration model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(TransporterRegistration, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
     @param.filter(TransporterRegistration) filter?: Filter<TransporterRegistration>,
    // @param.filter(TransporterRegistration) filter: Filter<TransporterRegistration> = {where : {and:[ {isActive: true}, {isVerified: true}]}},
  ): Promise<TransporterRegistration[]> {
    return this.transporterRegistrationRepository.find(filter);
  }

  @patch('/transporter-registrations', {
    responses: {
      '200': {
        description: 'TransporterRegistration PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TransporterRegistration, {partial: true}),
        },
      },
    })
    transporterRegistration: TransporterRegistration,
    @param.where(TransporterRegistration) where?: Where<TransporterRegistration>,
  ): Promise<Count> {
    return this.transporterRegistrationRepository.updateAll(transporterRegistration, where);
  }

  @get('/transporter-registrations/{id}', {
    responses: {
      '200': {
        description: 'TransporterRegistration model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(TransporterRegistration, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(TransporterRegistration, {exclude: 'where'}) filter?: FilterExcludingWhere<TransporterRegistration>
  ): Promise<TransporterRegistration> {
    return this.transporterRegistrationRepository.findById(id, filter);
  }

  @patch('/transporter-registrations/{id}', {
    responses: {
      '204': {
        description: 'TransporterRegistration PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(TransporterRegistration, {partial: true}),
        },
      },
    })
    transporterRegistration: TransporterRegistration,
  ): Promise<void> {
    await this.transporterRegistrationRepository.updateById(id, transporterRegistration);
  }

  @put('/transporter-registrations/{id}', {
    responses: {
      '204': {
        description: 'TransporterRegistration PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() transporterRegistration: TransporterRegistration,
  ): Promise<void> {
    await this.transporterRegistrationRepository.replaceById(id, transporterRegistration);
  }

  @del('/transporter-registrations/{id}', {
    responses: {
      '204': {
        description: 'TransporterRegistration DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.transporterRegistrationRepository.deleteById(id);
  }
}
