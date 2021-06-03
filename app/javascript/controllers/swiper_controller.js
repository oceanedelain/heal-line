import { Controller } from 'stimulus';
import Swiper, { Pagination } from 'swiper';

Swiper.use(Pagination);


export default class extends Controller {
  connect() {
    console.log('swiper connect');
    new Swiper(this.element, {
      // Default parameters
      loop: false,
      pagination: {
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true
      },
    });
  }
}
