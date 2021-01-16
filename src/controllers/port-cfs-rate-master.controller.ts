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
import {PortCfsRateMaster} from '../models';
import {PortCfsRateMasterRepository} from '../repositories';
@authenticate('jwt')
export class PortCfsRateMasterController {
  constructor(
    @repository(PortCfsRateMasterRepository)
    public portCfsRateMasterRepository: PortCfsRateMasterRepository,
  ) {}

  @post('/port-cfs-rate-masters', {
    responses: {
      '200': {
        description: 'PortCfsRateMaster model instance',
        content: {
          'application/json': {schema: getModelSchemaRef(PortCfsRateMaster)},
        },
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortCfsRateMaster, {
            title: 'NewPortCfsRateMaster',
            exclude: ['portCfsRateMasterId'],
          }),
        },
      },
    })
    portCfsRateMaster: Omit<PortCfsRateMaster, 'portCfsRateMasterId'>,
  ): Promise<PortCfsRateMaster> {
    const existing = await this.portCfsRateMasterRepository.find({
      where: {
        and: [
          {cfsMasterId: portCfsRateMaster.cfsMasterId},
          {portMasterId: portCfsRateMaster.portMasterId},
          {containerMasterId: portCfsRateMaster.containerMasterId},
          {weightMasterId: portCfsRateMaster.weightMasterId},
          {isActive: true},
        ],
      },
    });
    if (existing.length > 0) {
      throw new HttpErrors.UnprocessableEntity(
        'Data already Exists for this combination',
      );
    }
    return this.portCfsRateMasterRepository.create(portCfsRateMaster);
  }

  @get('/port-cfs-rate-masters/count', {
    responses: {
      '200': {
        description: 'PortCfsRateMaster model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.where(PortCfsRateMaster) where?: Where<PortCfsRateMaster>,
  ): Promise<Count> {
    return this.portCfsRateMasterRepository.count(where);
  }

  @get('/port-cfs-rate-masters', {
    responses: {
      '200': {
        description: 'Array of PortCfsRateMaster model instances',
        content: {
          'application/json': {
            schema: {
              type: 'array',
              items: getModelSchemaRef(PortCfsRateMaster, {
                includeRelations: true,
              }),
            },
          },
        },
      },
    },
  })
  async find(
    // @param.filter(PortCfsRateMaster) filter?: Filter<PortCfsRateMaster>,
    @param.filter(PortCfsRateMaster) filter: Filter<PortCfsRateMaster> = {where : {isActive: true}},
  ): Promise<PortCfsRateMaster[]> {
    return this.portCfsRateMasterRepository.find(filter);
  }

  @patch('/port-cfs-rate-masters', {
    responses: {
      '200': {
        description: 'PortCfsRateMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortCfsRateMaster, {partial: true}),
        },
      },
    })
    portCfsRateMaster: PortCfsRateMaster,
    @param.where(PortCfsRateMaster) where?: Where<PortCfsRateMaster>,
  ): Promise<Count> {
    return this.portCfsRateMasterRepository.updateAll(portCfsRateMaster, where);
  }

  @get('/port-cfs-rate-masters/{id}', {
    responses: {
      '200': {
        description: 'PortCfsRateMaster model instance',
        content: {
          'application/json': {
            schema: getModelSchemaRef(PortCfsRateMaster, {
              includeRelations: true,
            }),
          },
        },
      },
    },
  })
  async findById(
    @param.path.number('id') id: number,
    @param.filter(PortCfsRateMaster, {exclude: 'where'})
    filter?: FilterExcludingWhere<PortCfsRateMaster>,
  ): Promise<PortCfsRateMaster> {
    return this.portCfsRateMasterRepository.findById(id, filter);
  }

  @patch('/port-cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'PortCfsRateMaster PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(PortCfsRateMaster, {partial: true}),
        },
      },
    })
    portCfsRateMaster: PortCfsRateMaster,
  ): Promise<void> {
    await this.portCfsRateMasterRepository.updateById(id, portCfsRateMaster);
  }

  @put('/port-cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'PortCfsRateMaster PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() portCfsRateMaster: PortCfsRateMaster,
  ): Promise<void> {
    await this.portCfsRateMasterRepository.replaceById(id, portCfsRateMaster);
  }

  @del('/port-cfs-rate-masters/{id}', {
    responses: {
      '204': {
        description: 'PortCfsRateMaster DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.portCfsRateMasterRepository.deleteById(id);
  }
}
