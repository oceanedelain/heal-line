import { Controller } from "stimulus"
import Swiper from "swiper"
import 'swiper/swiper-bundle.css';

export default class extends Controller {
  connect() {
    const options = {
      loop: false,
      allowSlidePrev: true,
      allowSlideNext: true,
      mousewheel: true,
      keyboard: true,
      slidesPerView: 1,
    };


    new Swiper('#swiper', options);
  }
}
