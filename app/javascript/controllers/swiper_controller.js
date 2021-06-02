import { Controller } from "stimulus"
import Swiper from "swiper"
import 'swiper/swiper-bundle.css';

export default class extends Controller {
  connect() {
    const options = {
      pagination: {
        el: '.swiper-pagination',
        dynamicBullets: true,
      },
    };


    new Swiper('#swiper', options);
  }
}
