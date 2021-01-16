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
import {PortMaster} from '../models';
import {PortMasterRepository} from '../repositories';
@authenticate('jwt')
export class PortMasterController {
  constructor(
    @repository(PortMasterRepository)
    public portMasterRepository : PortMasterRepository,
  ) {}

  @post('/port-masters', {
    responses: {
      '200': {
        description: 'PortMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(PortMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortMaster, {
            title: 'NewPortMaster',
            exclude: ['portMasterId'],
          }),
        },
      },
    })
    portMaster: Omit<PortMaster, 'portMasterId'>,
  ): Promise<PortMaster> {
    return this.portMasterRepository.create(portMaster);
  }

  @get('/port-masters/count', {
    responses: {
      '200': {
        description: 'PortMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PortMaster) where?: Where<PortMaster>,
  ): Promise<Count> {
    return this.portMasterRepository.count(where);
  }

  @get('/port-masters', {
    responses: {
      '200': {
        description: 'Array of PortMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PortMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    // @param.filter(PortMaster) filter?: Filter<PortMaster>,
    @param.filter(PortMaster) filter: Filter<PortMaster> = {where : {isActive: true}},
  ): Promise<PortMaster[]> {
    return this.portMasterRepository.find(filter);
  }

  @patch('/port-masters', {
    responses: {
      '200': {
        description: 'PortMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortMaster, {partial: true}),
        },
      },
    })
    portMaster: PortMaster,
    @param.where(PortMaster) where?: Where<PortMaster>,
  ): Promise<Count> {
    return this.portMasterRepository.updateAll(portMaster, where);
  }

  @get('/port-masters/{id}', {
    responses: {
      '200': {
        description: 'PortMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PortMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PortMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<PortMaster>
  ): Promise<PortMaster> {
    return this.portMasterRepository.findById(id, filter);
  }

  @patch('/port-masters/{id}', {
    responses: {
      '204': {
        description: 'PortMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortMaster, {partial: true}),
        },
      },
    })
    portMaster: PortMaster,
  ): Promise<void> {
    await this.portMasterRepository.updateById(id, portMaster);
  }

  @put('/port-masters/{id}', {
    responses: {
      '204': {
        description: 'PortMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() portMaster: PortMaster,
  ): Promise<void> {
    await this.portMasterRepository.replaceById(id, portMaster);
  }

  @del('/port-masters/{id}', {
    responses: {
      '204': {
        description: 'PortMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.portMasterRepository.deleteById(id);
  }
}
