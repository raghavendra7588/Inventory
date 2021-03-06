import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { User } from './user.model';



@Injectable({
  providedIn: 'root'
})
export class LoginService {

  public masterBrandDataArray: any = [];
  // public BASE_API = 'http://localhost:64968';

  // public UPLOAD_DOCUMENT_URL = this.BASE_API + '/' + 'api/UploadFiles';


  public LOGIN_URL = 'http://3intellects.co.in/AdminApi/api//user/authenticate';  
  private LOGGED_IN_URL = 'https://3intellects.co.in/uat_AdminApi/api/User/authenticate';

  public seller_token: string;
  public seller_mapped_categories: any = [];
  public seller_object: any = [];
  public seller_id: number;
  public seller_name: any;
  constructor(public http: HttpClient) { }

  loginUser(user: User) {
    return this.http.post<any>(this.LOGGED_IN_URL, user);
  }

}
