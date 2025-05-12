import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrl = 'http://167.235.21.222:3000/products';
  private apiUrl2 = 'http://167.235.21.222:3000/category';

  constructor(private http: HttpClient) { }

  getData(): Observable<any> {
    return this.http.get<any>(this.apiUrl);
  }

  getData2(): Observable<any> {
    return this.http.get<any>(this.apiUrl2);
  }
}
