/* import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Ordercontainerdetails,
  Orders,
} from '../models';
import {OrdercontainerdetailsRepository} from '../repositories';

export class OrdercontainerdetailsOrdersController {
  constructor(
    @repository(OrdercontainerdetailsRepository)
    public ordercontainerdetailsRepository: OrdercontainerdetailsRepository,
  ) { }

  @get('/ordercontainerdetails/{id}/orders', {
    responses: {
      '200': {
        description: 'Orders belonging to Ordercontainerdetails',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Orders)},
          },
        },
      },
    },
  })
  async getOrders(
    @param.path.number('id') id: typeof Ordercontainerdetails.prototype.order_container_syscode,
  ): Promise<Orders> {
    return this.ordercontainerdetailsRepository.belongsTo(id);
  }
}
 */
