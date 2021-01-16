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
import {MasterType} from '../models';
import {MasterTypeRepository} from '../repositories';
@authenticate('jwt')
export class MasterTypeController {
  constructor(
    @repository(MasterTypeRepository)
    public masterTypeRepository : MasterTypeRepository,
  ) {}

  @post('/master-types', {
    responses: {
      '200': {
        description: 'MasterType model instance',
        content: {'application/json': {schema: getModelSchemaRef(MasterType)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MasterType, {
            title: 'NewMasterType',
            exclude: ['masterTypeId'],
          }),
        },
      },
    })
    masterType: Omit<MasterType, 'masterTypeId'>,
  ): Promise<MasterType> {
    return this.masterTypeRepository.create(masterType);
  }

  @get('/master-types/count', {
    responses: {
      '200': {
        description: 'MasterType model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(MasterType) where?: Where<MasterType>,
  ): Promise<Count> {
    return this.masterTypeRepository.count(where);
  }

  @get('/master-types', {
    responses: {
      '200': {
        description: 'Array of MasterType model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(MasterType, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    @param.filter(MasterType) filter?: Filter<MasterType>,
  ): Promise<MasterType[]> {
    return this.masterTypeRepository.find(filter);
  }

  @patch('/master-types', {
    responses: {
      '200': {
        description: 'MasterType PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MasterType, {partial: true}),
        },
      },
    })
    masterType: MasterType,
    @param.where(MasterType) where?: Where<MasterType>,
  ): Promise<Count> {
    return this.masterTypeRepository.updateAll(masterType, where);
  }

  @get('/master-types/{id}', {
    responses: {
      '200': {
        description: 'MasterType model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(MasterType, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(MasterType, {exclude: 'where'}) filter?: FilterExcludingWhere<MasterType>
  ): Promise<MasterType> {
    return this.masterTypeRepository.findById(id, filter);
  }

  @patch('/master-types/{id}', {
    responses: {
      '204': {
        description: 'MasterType PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(MasterType, {partial: true}),
        },
      },
    })
    masterType: MasterType,
  ): Promise<void> {
    await this.masterTypeRepository.updateById(id, masterType);
  }

  @put('/master-types/{id}', {
    responses: {
      '204': {
        description: 'MasterType PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() masterType: MasterType,
  ): Promise<void> {
    await this.masterTypeRepository.replaceById(id, masterType);
  }

  @del('/master-types/{id}', {
    responses: {
      '204': {
        description: 'MasterType DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.masterTypeRepository.deleteById(id);
  }
}
