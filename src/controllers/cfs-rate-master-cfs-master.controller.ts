import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  CfsRateMaster,
  CfsMaster,
} from '../models';
import {CfsRateMasterRepository} from '../repositories';

export class CfsRateMasterCfsMasterController {
  constructor(
    @repository(CfsRateMasterRepository)
    public cfsRateMasterRepository: CfsRateMasterRepository,
  ) { }

  @get('/cfs-rate-masters/{id}/cfs-master', {
    responses: {
      '200': {
        description: 'CfsMaster belonging to CfsRateMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(CfsMaster)},
          },
        },
      },
    },
  })
  async getCfsMaster(
    @param.path.number('id') id: typeof CfsRateMaster.prototype.cfsRateId,
  ): Promise<CfsMaster> {
    return this.cfsRateMasterRepository.cfsMaster(id);
  }
}
