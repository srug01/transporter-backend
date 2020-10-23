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
import {PortTerminalMaster} from '../models';
import {PortTerminalMasterRepository} from '../repositories';

export class PortTerminalMasterController {
  constructor(
    @repository(PortTerminalMasterRepository)
    public portTerminalMasterRepository : PortTerminalMasterRepository,
  ) {}

  @post('/port-terminal-masters', {
    responses: {
      '200': {
        description: 'PortTerminalMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(PortTerminalMaster)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortTerminalMaster, {
            title: 'NewPortTerminalMaster',
            exclude: ['portTerminalId'],
          }),
        },
      },
    })
    portTerminalMaster: Omit<PortTerminalMaster, 'portTerminalId'>,
  ): Promise<PortTerminalMaster> {
    return this.portTerminalMasterRepository.create(portTerminalMaster);
  }

  @get('/port-terminal-masters/count', {
    responses: {
      '200': {
        description: 'PortTerminalMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PortTerminalMaster) where?: Where<PortTerminalMaster>,
  ): Promise<Count> {
    return this.portTerminalMasterRepository.count(where);
  }

  @get('/port-terminal-masters', {
    responses: {
      '200': {
        description: 'Array of PortTerminalMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PortTerminalMaster, {includeRelations: true}),
            },
          },
        },
      },
    },
  })
  async find(
    // @param.filter(PortTerminalMaster) filter?: Filter<PortTerminalMaster>,
    @param.filter(PortTerminalMaster) filter: Filter<PortTerminalMaster> = {where : {isActive: true}},
  ): Promise<PortTerminalMaster[]> {
    return this.portTerminalMasterRepository.find(filter);
  }

  @patch('/port-terminal-masters', {
    responses: {
      '200': {
        description: 'PortTerminalMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortTerminalMaster, {partial: true}),
        },
      },
    })
    portTerminalMaster: PortTerminalMaster,
    @param.where(PortTerminalMaster) where?: Where<PortTerminalMaster>,
  ): Promise<Count> {
    return this.portTerminalMasterRepository.updateAll(portTerminalMaster, where);
  }

  @get('/port-terminal-masters/{id}', {
    responses: {
      '200': {
        description: 'PortTerminalMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PortTerminalMaster, {includeRelations: true}),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PortTerminalMaster, {exclude: 'where'}) filter?: FilterExcludingWhere<PortTerminalMaster>
  ): Promise<PortTerminalMaster> {
    return this.portTerminalMasterRepository.findById(id, filter);
  }

  @patch('/port-terminal-masters/{id}', {
    responses: {
      '204': {
        description: 'PortTerminalMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortTerminalMaster, {partial: true}),
        },
      },
    })
    portTerminalMaster: PortTerminalMaster,
  ): Promise<void> {
    await this.portTerminalMasterRepository.updateById(id, portTerminalMaster);
  }

  @put('/port-terminal-masters/{id}', {
    responses: {
      '204': {
        description: 'PortTerminalMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() portTerminalMaster: PortTerminalMaster,
  ): Promise<void> {
    await this.portTerminalMasterRepository.replaceById(id, portTerminalMaster);
  }

  @del('/port-terminal-masters/{id}', {
    responses: {
      '204': {
        description: 'PortTerminalMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.portTerminalMasterRepository.deleteById(id);
  }
}
