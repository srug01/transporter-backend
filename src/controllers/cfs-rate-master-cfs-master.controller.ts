import {authenticate} from '@loopback/authentication';
import {repository} from '@loopback/repository';
import {get, getModelSchemaRef, param} from '@loopback/rest';
import {CfsMaster, CfsPortRateMaster} from '../models';
import {CfsPortRateMasterRepository} from '../repositories';
@authenticate('jwt')
export class CfsPortRateMasterCfsMasterController {
  constructor(
    @repository(CfsPortRateMasterRepository)
    public CfsPortRateMasterRepository: CfsPortRateMasterRepository,
  ) {}

  @get('/cfs-rate-masters/{id}/cfs-master', {
    responses: {
      '200': {
        description: 'CfsMaster belonging to CfsPortRateMaster',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(CfsMaster)},
          },
        },
      },
    },
  })
  async getCfsMaster(
    @param.path.number('id') id: typeof CfsPortRateMaster.prototype.cfsRateId,
  ): Promise<CfsMaster> {
    return this.CfsPortRateMasterRepository.cfsMaster(id);
  }
}
