import { Injectable, EventEmitter } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class EmitterService {
  public name = 'raghavendraa';

  public isRecord: EventEmitter<boolean>;
  public isVendorMasterUpdated: EventEmitter<boolean>;
  public isAddressCreated: EventEmitter<boolean>;
  public isPriceListUpdated: EventEmitter<boolean>;

  constructor() {
    this.isRecord = new EventEmitter();
    this.isVendorMasterUpdated = new EventEmitter();
    this.isAddressCreated = new EventEmitter();
    this.isPriceListUpdated = new EventEmitter();
  }
}
