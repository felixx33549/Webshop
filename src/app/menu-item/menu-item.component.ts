import { Component, Input, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-menu-item',
  imports: [],
  templateUrl: './menu-item.component.html',
  styleUrls: [
    '../../styles.css',
    '../app.component.css',
    './menu-item.component.css'
  ]
})
export class MenuItemComponent {
  @Input() name: string = 'Default Category Name';
  @Input() link: string = '';
  @Output() categoryClicked = new EventEmitter<void>();

  onCategoryClick(): void {
    this.categoryClicked.emit();
  }
}
