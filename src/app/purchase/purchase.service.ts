import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { LoginService } from '../login/login.service';
import { PriceList } from './purchase.model';



@Injectable({
  providedIn: 'root'
})
export class PurchaseService {
  price: any;
  token: string;
  sellerId: string;
  intSellerId: number;
  storageSellerId: number;

  priceListData: any = [];
  masterBrandData: any = [];
  extractPriceListData: any = [];
  finalPriceList: any = [];
  allvendorData: any = [];
  allBrandData: any = [];

  private ADMIN_BASE_URL = 'http://203.112.144.38/uat_AdminApi/api/';
  private BASE_URL = 'http://203.112.144.38/uat_InventoryService/';
  //private BASE_URL = 'http://localhost:55547/';

  private GET_ALL_ADDRESSS_DATA = this.BASE_URL + 'api/Address';
  private SAVE_VENDOR_MASTER = this.BASE_URL + 'api/Vendor';
  private GET_SUBCATEGORIES = this.ADMIN_BASE_URL + 'Category/getall';
  private GET_BRANDS = this.ADMIN_BASE_URL + 'ProductSellerMapping/getalledit';
  private GET_ALL_VENDOR_DATA = this.BASE_URL + 'api/Vendor';
  private SAVE_ADDRESS_MASTER = this.BASE_URL + 'api/address';
  private SAVE_PRICE_LIST = this.BASE_URL + 'api/PriceList';
  private SAVE_MULTIPLE_PRICE_LIST = this.BASE_URL + 'api/PriceList/multiple';
  private GET_ALL_PRICELIST_DATA = this.BASE_URL + 'api/PriceList';
  private SAVE_PURCHASE_ORDER_MASTER = this.BASE_URL + 'api/PurchaseOrder';
  private SAVE_PURCHASE_ORDER_ITEM_MASTER = this.BASE_URL + 'api/PurchaseOrderItem';
  private GET_PURCHASE_ORDER_DATA = this.BASE_URL + 'api/PurchaseReport';
  private GET_PURCHASE_ORDER = this.BASE_URL + 'api/PurchaseOrder/getOrderIdByVendorId';
  private GET_PURCHASE_ORDER_ITEM_DATA = this.BASE_URL + 'api/PurchaseOrder/getOrderItemData';

  public PURCHASE_VENDOR_ORDER_WISE = this.BASE_URL + 'api/PurchaseReport/purchaseReportVendorOrderWise';
  public GET_VENDOR_VIEW_DATA = this.BASE_URL + 'api/VendorView';

  private GET_DASHBOARD_PURCHASE_PER_DAY = this.BASE_URL + 'api/DashBoard/postPurchasePerDay';
  private GET_DASHBOARD_PURCHASE_PER_MONTH = this.BASE_URL + 'api/DashBoard/postPurchasePerMonth';
  private GET_DASHBOARD_PURCHASE_ORDER_PER_DAY = this.BASE_URL + 'api/DashBoard/postPurchaseOrderPerDay';
  private GET_DASHBOARD_PURCHASE_ORDER_PER_MONTH = this.BASE_URL + 'api/DashBoard/postPurchaseOrderPerMonth';
  private GET_DASHBOARD_FASTEST_MOVING_DATA_PER_MONTH = this.BASE_URL + 'api/DashBoard';

  constructor(
    public http: HttpClient, 
    public loginService: LoginService) {
    this.token = sessionStorage.getItem('token');
    this.sellerId = sessionStorage.getItem('sellerId');
    this.storageSellerId = Number(sessionStorage.getItem('sellerId'));
  }


  getAllSubCategories(parentid) {
    const data = { 'parentid': parentid }
    var reqHeader = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.token
    });
    return this.http.post(this.GET_SUBCATEGORIES, data, { headers: reqHeader });
  }



  getAllBrand(parenetid: any, SubCategoryId: string) {
    const data = { "SellerId": this.sellerId, "CategoryId": parenetid, "SubCategoryId": SubCategoryId }
    var reqHeader = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.token
    });
    return this.http.post(this.GET_BRANDS, data, { headers: reqHeader });
  }

  getEveryBrand() {
    const data = { "SellerId": this.sellerId, "CategoryId": "0", "SubCategoryId": "0" }
    var reqHeader = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.token
    });
    return this.http.post(this.GET_BRANDS, data, { headers: reqHeader });
  }

  getEachBrand(categoryId, subcategoryId) {
    const data = { "SellerId": this.sellerId, "CategoryId": categoryId, "SubCategoryId": subcategoryId }
    var reqHeader = new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + this.token
    });
    return this.http.post(this.GET_BRANDS, data, { headers: reqHeader });
  }

  getAddressData() {
    return this.http.get(this.GET_ALL_ADDRESSS_DATA + '/' + this.storageSellerId);
  }

  saveVendorMaster(vendorData: any) {
    return this.http.post(this.SAVE_VENDOR_MASTER, vendorData);
  }

  getAllVendorData(sellerId: string) {
    return this.http.get(this.GET_ALL_VENDOR_DATA + '/' + sellerId);
  }

  saveAddressMaster(addressData) {
    return this.http.post(this.SAVE_ADDRESS_MASTER, addressData);
  }

  savePriceListMaster(priceListData) {
    return this.http.post(this.SAVE_PRICE_LIST, priceListData);
  }

  saveMultiplePriceList(priceListData) {
    return this.http.post(this.SAVE_MULTIPLE_PRICE_LIST, priceListData);
  }

  getAllPriceListData(sellerId: number) {
    return this.http.get(this.GET_ALL_PRICELIST_DATA + '/' + sellerId);
  }

  savePurchaseOrderMaster(purchaseOrderData) {
    return this.http.post(this.SAVE_PURCHASE_ORDER_MASTER, purchaseOrderData);
  }

  savePurchaseOrderItemMaster(purchaseOrderItem) {
    return this.http.post(this.SAVE_PURCHASE_ORDER_ITEM_MASTER, purchaseOrderItem);
  }

  getPurchaseReportData(purchaseReport) {
    return this.http.post(this.PURCHASE_VENDOR_ORDER_WISE, purchaseReport);
  }

  getPurchaseReportById(id) {
    return this.http.get(this.GET_PURCHASE_ORDER_DATA + '/' + id);
  }

  getAllVendorViewData(vendorView) {
    return this.http.post(this.GET_VENDOR_VIEW_DATA, vendorView);
  }

  getAllPurchaseOrderData(vendorData) {
    return this.http.post(this.GET_PURCHASE_ORDER, vendorData);
  }

  getAllPurchaseOrderItemData(data) {
    return this.http.post(this.GET_PURCHASE_ORDER_ITEM_DATA, data);
  }

  getDashBoardPurchasePerDayData(purchaseData) {
    return this.http.post(this.GET_DASHBOARD_PURCHASE_PER_DAY, purchaseData);
  }

  getDashBoardPurchasePerMonthData(purchaseData) {
    return this.http.post(this.GET_DASHBOARD_PURCHASE_PER_MONTH, purchaseData);
  }

  getDashBoardPurchaseOrderPerDayData(purchaseReport) {
    return this.http.post(this.GET_DASHBOARD_PURCHASE_ORDER_PER_DAY, purchaseReport);
  }

  getDashBoardPurchaseOrderPerMonth(purchaseReport) {
    return this.http.post(this.GET_DASHBOARD_PURCHASE_ORDER_PER_MONTH, purchaseReport);
  }

  getFastestMovingDataPerMonth(sellerId: string) {
    return this.http.get(this.GET_DASHBOARD_FASTEST_MOVING_DATA_PER_MONTH + '/' + sellerId);
  }
}
