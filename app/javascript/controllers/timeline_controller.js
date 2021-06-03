import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['card']
  static values = { focus: String }

  connect() {
    if (this.focusValue) {
      const card = this.element.querySelector(`#${this.focusValue}`);
      if (!card) return;
      card.classList.add('open');
      card.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
    }
  }

  focus(event) {
    this.cardTargets
        .filter(card => card !== event.currentTarget)
        .forEach(card => card.classList.remove('open'))
    event.currentTarget.classList.toggle('open')
  }
}
