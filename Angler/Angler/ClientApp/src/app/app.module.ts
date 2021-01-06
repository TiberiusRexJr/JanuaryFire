import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { MDBBootstrapModule } from 'angular-bootstrap-md';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DatatablesComponentComponent } from './datatables-component/datatables-component.component';
import { HttpClientModule } from '@angular/common/http';
import { HttpService } from './http.service';

@NgModule({
  declarations: [
    AppComponent,
    DatatablesComponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,MDBBootstrapModule.forRoot(),FormsModule,HttpClientModule
  ],
  providers: [HttpService],
  bootstrap: [AppComponent]
})
export class AppModule { }
