import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-account-item',
  imports: [
    CommonModule
  ],
  templateUrl: './account-item.component.html',
  styleUrls: [
    '../../styles.css',
    '../app.component.css',
    './account-item.component.css'
  ]
})
export class AccountItemComponent {
  @Input() title: string = '';
  @Output() accountButtonClicked = new EventEmitter<void>();

  onButtonClick(): void {
    this.accountButtonClicked.emit();
  }
}
