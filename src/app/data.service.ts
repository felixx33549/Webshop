import { Injectable } from '@angular/core';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  private apiUrlProducts = 'http://167.235.21.222:3000/products';
  private apiUrlCategory = 'http://167.235.21.222:3000/category';

  constructor(private http: HttpClient) { }

  getDataProducts(): Observable<any> {
    return this.http.get<any>(this.apiUrlProducts);
  }

  getDataCategory(): Observable<any> {
    return this.http.get<any>(this.apiUrlCategory);
  }

  getDataProductsByCategory(category: string): Observable<any> {
    return this.http.get<any>(`${this.apiUrlProducts}?category=${category}`);
  }
}
