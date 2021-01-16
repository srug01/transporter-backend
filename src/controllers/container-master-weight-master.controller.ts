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
  ContainerMaster,
  WeightMaster
} from '../models';
import {ContainerMasterRepository} from '../repositories';
@authenticate('jwt')
export class ContainerMasterWeightMasterController {
  constructor(
    @repository(ContainerMasterRepository) protected containerMasterRepository: ContainerMasterRepository,
  ) { }

  @get('/container-masters/{id}/weight-masters', {
    responses: {
      '200': {
        description: 'Array of ContainerMaster has many WeightMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(WeightMaster)},
          },
        },
      },
    },
  })
  async find(
    @param.path.number('id') id: number,
    @param.query.object('filter') filter?: Filter<WeightMaster>,
  ): Promise<WeightMaster[]> {
    return this.containerMasterRepository.weightMasters(id).find(filter);
  }

  @post('/container-masters/{id}/weight-masters', {
    responses: {
      '200': {
        description: 'ContainerMaster model instance',
        content: {'application/json': {schema: getModelSchemaRef(WeightMaster)}},
      },
    },
  })
  async create(
    @param.path.number('id') id: typeof ContainerMaster.prototype.containerMasterId,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(WeightMaster, {
            title: 'NewWeightMasterInContainerMaster',
            exclude: ['weightMasterId'],
            optional: ['containerMasterId']
          }),
        },
      },
    }) weightMaster: Omit<WeightMaster, 'weightMasterId'>,
  ): Promise<WeightMaster> {
    return this.containerMasterRepository.weightMasters(id).create(weightMaster);
  }

  @patch('/container-masters/{id}/weight-masters', {
    responses: {
      '200': {
        description: 'ContainerMaster.WeightMaster PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async patch(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(WeightMaster, {partial: true}),
        },
      },
    })
    weightMaster: Partial<WeightMaster>,
    @param.query.object('where', getWhereSchemaFor(WeightMaster)) where?: Where<WeightMaster>,
  ): Promise<Count> {
    return this.containerMasterRepository.weightMasters(id).patch(weightMaster, where);
  }

  @del('/container-masters/{id}/weight-masters', {
    responses: {
      '200': {
        description: 'ContainerMaster.WeightMaster DELETE success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async delete(
    @param.path.number('id') id: number,
    @param.query.object('where', getWhereSchemaFor(WeightMaster)) where?: Where<WeightMaster>,
  ): Promise<Count> {
    return this.containerMasterRepository.weightMasters(id).delete(where);
  }
}
