import { Controller } from 'stimulus';
import Swiper from 'swiper';

export default class extends Controller {
  connect() {
    console.log('swiper connect');
    new Swiper(this.element, {
      // Default parameters
      loop: false,
    };
  }
}
