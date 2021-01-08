import { Inject, Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry, tap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Customer } from 'src/Models/Customer';

@Injectable({
  providedIn: 'root'
})

export class HttpService {

  PostUrl:string="api/Customers/PostCustomer/customer";
  PutUrl:string="api/Customers/UpdateCustomer/customer";
  GetUrl: string = "/api/Customers/Get";
  GetAll: string = "api/Customers/GetCustomers";
  DeleteUrl: string = "api/Customers/DeleteCustomer/customers";
  customers:Customer [] =[];
  AngularAppUrl:string;
  baseUrl:string;
  url: string = "https://localhost:44320/api/Customers/GetCustomers";

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8',

    }),
    observe: 'response',
    responseType:'json'
  };



  constructor(private http: HttpClient)
  {
    this.AngularAppUrl = environment.appUrl;


  }



  PostCustomer()
  {

  }
  PutCustomer()
  {

  }
  DeleteCustomer()
  {

  }


    async getData()
  {

     const data= await this.http.get<Customer>(this.GetUrl).toPromise();
      return data;
  }

  errorHandler(error): Observable<never> {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Get client-side error
      errorMessage = error.error.message;
    } else {
      // Get server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    console.log(errorMessage);
    return throwError(errorMessage);
  }


}
