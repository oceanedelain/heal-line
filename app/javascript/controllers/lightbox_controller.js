import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['modal']

  show(event) {
    event.stopPropagation();
    this.modalTarget.classList.remove('d-none')
  }

  hide(event) {
    event.stopPropagation();
    this.modalTarget.classList.add('d-none')
  }
}
