import { Component, OnInit } from '@angular/core';
import { DataService } from './data.service';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ProductComponent } from './product/product.component';
import { MenuItemComponent } from './menu-item/menu-item.component';
import { HeaderItemComponent } from './header-item/header-item.component';

@Component({
  selector: 'app-root',
  imports: [
    RouterOutlet,
    CommonModule,
    HttpClientModule,
    ProductComponent,
    MenuItemComponent,
    HeaderItemComponent
  ],
  templateUrl: './app.component.html',
  styleUrls: [
    '../styles.css',
    './app.component.css'
  ]
})
export class AppComponent implements OnInit {
  title = 'Webshop';
  dataProducts: any[] = [];
  dataCategory: any[] = [];

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    this.getAllProducts();
    this.dataService.getDataCategory().subscribe((data) => {
      // console.log(data);
      this.dataCategory = data;
    });
  }

  clearDataProducts(): void {
    this.dataProducts = [];
  }

  getAllProducts(): void {
    this.dataService.getDataProducts().subscribe((data) => {
      // console.log(data);
      this.dataProducts = data;
    });
  }

  getCategoryProducts(category: number): void {
    this.dataService.getDataProductsByCategory(category).subscribe((data) => {
      // console.log(data);
      this.dataProducts = data;
    });
  }
}
