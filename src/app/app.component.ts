import { Component, OnInit } from '@angular/core';
import { DataService } from './data.service';
import { RouterOutlet } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { ProductComponent } from './product/product.component';
import { MenuItemComponent } from './menu-item/menu-item.component';
import { HeaderItemComponent } from './header-item/header-item.component';
import { AccountItemComponent } from './account-item/account-item.component';
import { CardItemComponent } from './card-item/card-item.component';

@Component({
  selector: 'app-root',
  imports: [
    RouterOutlet,
    CommonModule,
    HttpClientModule,
    ProductComponent,
    MenuItemComponent,
    HeaderItemComponent,
    AccountItemComponent,
    CardItemComponent
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
  headline: string = 'Hallo Besucher!';
  message: string = 'Willkommen bei Computer Wolf.';
  displayContent: string = 'home';

  card: any[] = [];

  constructor(private dataService: DataService) { }

  ngOnInit(): void {
    //this.getAllProducts();
    this.dataService.getDataCategory().subscribe((data) => {
      // console.log(data);
      this.dataCategory = data;
    });
  }

  clearDataProducts(): void {
    this.dataProducts = [];
    this.headline = 'Hallo Besucher!';
    this.message = 'Willkommen bei Computer Wolf.';
    this.displayContent = 'home';
  }

  getAllProducts(): void {
    this.dataService.getDataProducts().subscribe((data) => {
      // console.log(data);
      this.dataProducts = data;
    });
    this.headline = 'Alle Produkte';
    this.message = '';
    this.displayContent = 'product';
  }

  getCategoryProducts(category: number): void {
    this.dataService.getDataProductsByCategory(category).subscribe((data) => {
      // console.log(data);
      this.dataProducts = data;
    });
    this.headline = 'Produkte der Kategorie ';
    const categoryName = this.dataCategory.find(item => item.id === category)?.name || 'Unbekannte Kategorie';
    this.headline += categoryName;
    this.message = '';
    this.displayContent = 'product';
  }

  onImpressumClick(): void {
    this.dataProducts = [];
    this.headline = 'Impressum';
    this.message = 'Computer Wolf<br><br>' +
      'Inhaber: Felix Leuchtmann<br>' +
      'Östliche Rheinbrückenstraße 50<br>' +
      '76187 Karlsruhe<br>' +
      'Tel: 01234/56789<br>' +
      'E-Mail: info@computer-wolf.de';
  }

  addToCard(product: any): void {
    const existingProduct = this.card.find(item => item.id === product.id);
    if (existingProduct) {
      existingProduct.quantity += 1;
    } else {
      this.card.push({ ...product, quantity: 1 });
    }
  }

  removeFromCard(product: any): void {
    const index = this.card.findIndex(item => item.id === product.id);
    if (index !== -1) {
      this.card[index].quantity -= 1;
      if (this.card[index].quantity <= 0) {
        this.card.splice(index, 1);
      }
    }
  }

  public get totalPrice(): number {
    return +(this.card?.reduce((sum, item) => sum + (item.price * (item.quantity || 1)), 0) || 0).toFixed(2);
  }

  pillClick(title: string): void {
    if (title === 'Login') {
      this.headline = 'Login';
      this.message = 'Bitte loggen Sie sich ein.';
      this.displayContent = 'account';
      return;
    }
    if (title === 'Account') {
      this.headline = 'Account';
      this.message = '';
      this.displayContent = 'account';
      return;
    }
    if (title === 'Warenkorb') {
      this.displayContent = 'card';
      this.headline = 'Warenkorb';
      this.message = '';
    }
  }
}
