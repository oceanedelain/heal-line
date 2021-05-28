import { Controller } from "stimulus"

export default class extends Controller {
  static values = {
    focus: String,
  }

  connect() {
    if (this.focusValue) {
      const card = this.element.querySelector(`#${this.focusValue}`);
      if (!card) return;
      card.classList.add('open');
    }
  }
}
