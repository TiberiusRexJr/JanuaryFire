import { Inject, Injectable } from '@angular/core';
import { HttpClient,HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Customer } from 'src/Models/Customer';

@Injectable({
  providedIn: 'root'
})

export class HttpService {

  PostUrl:string="api/Customers/PostCustomer/customer";
  PutUrl:string="api/Customers/UpdateCustomer/customer";
  GetUrl:string="/api/Customers/GetCustomers";
  DeleteUrl:string="api/Customers/DeleteCustomer/customers";

  AngularAppUrl:string;
  baseUrl:string;
  url: string = "https://localhost:44320/api/Customers/GetCustomers";

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json; charset=utf-8'
    })
  };



  constructor(private http: HttpClient)
  {
      this.AngularAppUrl=environment.appUrl;

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
  GetAllCustomers():Observable<Customer[]>
  {
    var customers = this.http.get<Customer[]>(this.GetUrl);
    console.log(customers);
    return customers;
  }
  getData() {

    return this.http.get <Customer[]>('/api/Customers/GetCustomers');  //https://localhost:44352/ webapi host url  
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
