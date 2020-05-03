import { Injectable } from '@angular/core';
import { environment } from '../../../environments/environment';
import { HttpHeaders, HttpClient, HttpParams } from '@angular/common/http';
import { Observable ,  throwError } from 'rxjs';

import { JwtService } from './jwt.service';
import { catchError, timeout } from 'rxjs/operators';

@Injectable()
export class ApiService {
  
  constructor(
    private http: HttpClient,
    private jwtService: JwtService
  ) {}

  private formatErrors(error: any) {
    return  throwError(error.error);
  }

  get(path: string, params: HttpParams = new HttpParams()): Observable<any> {
    return this.http.get(`${environment.api_url}${path}`, { params })
      .pipe(catchError(this.formatErrors));
  }

  put(path: string, body: Object = {}): Observable<any> {
    return this.http.put(
      `${environment.api_url}${path}`,
      JSON.stringify(body)
    ).pipe(catchError(this.formatErrors));
  }

  post(path: string, body: Object = {}): Observable<any> {
    return this.http.post(
      `${environment.api_url}${path}`,
      JSON.stringify(body)
    ).pipe(catchError(this.formatErrors));
  }
  
  postdocument(path: string, body: Object = {}): Observable<any> {
    const httpOptions: Object = {
      headers: new HttpHeaders({ 'Content-Type': 'multipart/form-data' }),
      observe: 'response' as 'response',
      timeout: 5000,
      transformRequest: function(data, headersGetterFunction) {
        return data;
      }
    };
    
    return this.http.post(
      `${environment.api_url}${path}`,
      body,
      //httpOptions,
      
    ).pipe(catchError(this.formatErrors));
  }

  postheader(path: string, body: Object = {}): Observable<any> {
    const httpOptions: Object = {
      headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
      observe: 'response' as 'response'
    };
    return this.http.post(
      `${environment.api_url}${path}`,
      JSON.stringify(body),
      httpOptions
    ).pipe(catchError(this.formatErrors));
  }

  delete(path): Observable<any> {
    return this.http.delete(
      `${environment.api_url}${path}`
    ).pipe(catchError(this.formatErrors));
  }
}
