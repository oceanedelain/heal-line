import { Controller } from 'stimulus';
import Swiper from 'swiper';
import 'swiper/swiper-bundle.css';

export default class extends Controller {
  // static targets = ['target'];
  // static classes = ['class'];
  // static values = { name: Type };

  initialize() {}

  connect() {
    const options = {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
    };

    const swiper = new Swiper('#swiper', options);
  }
}
