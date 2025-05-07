import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-product',
  imports: [],
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent {
  @Input() name: string = 'Default Product Name';
  @Input() price: number = 0;
  @Input() description: string = 'Default Product Description';
}
