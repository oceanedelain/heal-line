import { Controller } from "stimulus"
import Swiper from "swiper"
import 'swiper/swiper-bundle.css';

export default class extends Controller {
  connect() {
    const options = {
      loop: false,
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    };


    new Swiper('#swiper', options);
  }
}
