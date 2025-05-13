import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-product',
  imports: [],
  templateUrl: './product.component.html',
  styleUrls: [
    '../../styles.css',
    '../app.component.css',
    './product.component.css'
  ]
})
export class ProductComponent {
  @Input() name: string = 'Default Product Name';
  @Input() price: number = 0;
  @Input() description: string = 'Default Product Description';
  @Input() quantity: number = 0;
  @Output() addToCardClicked = new EventEmitter<void>();

  onAddToCardClick(): void {
    this.addToCardClicked.emit();
  }
}
