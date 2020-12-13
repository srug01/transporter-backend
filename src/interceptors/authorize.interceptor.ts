import {AuthenticationBindings, AuthenticationMetadata} from '@loopback/authentication';
import {Getter, globalInterceptor, inject, Interceptor, InvocationContext, InvocationResult, Provider, ValueOrPromise} from '@loopback/context';
import {MyUserProfile, RequiredPermissions} from '../types';
/**
 * This class will be bound to the application as an `Interceptor` during
 * `boot`
 */
@globalInterceptor('', {tags: {name: 'authorize'}})
export class AuthorizeInterceptor implements Provider<Interceptor> {
  constructor(
    @inject(AuthenticationBindings.METADATA)
    public metadata: AuthenticationMetadata,
    @inject.getter(AuthenticationBindings.CURRENT_USER)
    public getCurrentUser: Getter<MyUserProfile>,
  ) {}

  /**
   * This method is used by LoopBack context to produce an interceptor function
   * for the binding.
   *
   * @returns An interceptor function
   */
  value() {
    return this.intercept.bind(this);
  }

  /**
   * The logic to intercept an invocation
   * @param invocationCtx - Invocation context
   * @param next - A function to invoke next interceptor or the target method
   */
  async intercept(
    invocationCtx: InvocationContext,
    next: () => ValueOrPromise<InvocationResult>,
  ) {
    // eslint-disable-next-line no-useless-catch
    try {
      // Add pre-invocation logic here
      console.log('Log from authorize global interceptor');
      console.log(this.metadata);
      //if you will not provide options in your @authenticate decorator
      //this line will be executed
      if (!this.metadata) return next();

      const result = await next();
      const requiredPermissions = this.metadata.options as RequiredPermissions;
      console.log(requiredPermissions);
      const user = await this.getCurrentUser();
      // console.log(user);

      /* COMMENTED FOR NOW UP const results = intersection(
        user.permissions,
        requiredPermissions.required,
      ).length;
      if (results !== requiredPermissions.required.length) {
        throw new HttpErrors.Forbidden('INVALID ACCESS PERMISSIONS');
      }  COMMENTED FOR NOW UP*/

      //check the user permissions
      return result;
    } catch (err) {
      // Add error handling logic here
      throw err;
    }
  }
}
