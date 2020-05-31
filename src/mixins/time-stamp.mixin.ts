/* import {Class} from '@loopback/repository';

export function TimeStampMixin<T extends MixinTarget<object>>(baseClass: T) {
  return class extends baseClass {
    // add a new property `createdAt`
    public createdAt: Date;
    constructor(...args: any[]) {
      super(args);
      this.createdAt = new Date();
    }
    printTimeStamp() {
      console.log('Instance created at: ' + this.createdAt);
    }
  };
} */
