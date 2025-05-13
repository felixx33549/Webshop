import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-card-item',
  imports: [],
  templateUrl: './card-item.component.html',
  styleUrls: [
    '../../styles.css',
    '../app.component.css',
    './card-item.component.css'
  ]
})
export class CardItemComponent {
  @Input() name: string = 'Default Product Name';
  @Input() price: number = 0;
  @Input() quantity: number = 0;
  @Output() removeFromCardClicked = new EventEmitter<void>();

  onRemoveClick(): void {
    this.removeFromCardClicked.emit();
  }
}
