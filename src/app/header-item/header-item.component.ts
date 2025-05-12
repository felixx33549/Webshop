import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-header-item',
  imports: [],
  templateUrl: './header-item.component.html',
  styleUrls: [
    '../../styles.css',
    '../app.component.css',
    './header-item.component.css'
  ]
})
export class HeaderItemComponent {
  @Input() title: string = 'Title';
  @Input() imgSrc: string = '';
}
