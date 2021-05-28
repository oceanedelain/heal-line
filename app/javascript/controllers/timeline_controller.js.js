import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    if (this.element.dataset.focus) {
      this.element.querySelector(`#${this.element.dataset.focus}`).classList.add('open')
    }
  }
}
