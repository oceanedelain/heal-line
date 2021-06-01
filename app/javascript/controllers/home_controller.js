import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['stroke', 'circles'];

  initialize() {
    this.observer = new IntersectionObserver(this.manageObervables.bind(this));
  }

  connect() {
    this.element.querySelector('[data-consultation="true"').click();
  }

  setObservables() {
    this.strokeTargets.forEach((item) => this.observer.observe(item));
  }

  manageObervables(observables) {
    console.log(overvales);
  }

  center({ currentTarget }) {
    if (currentTarget.dataset.consultation === 'true') {
      currentTarget.scrollIntoView({
        behavior: 'smooth',
        block: 'start',
        inline: 'center',
      });
      this.strokeTargets.forEach((item) => item.classList.remove('active'));
      currentTarget.querySelector('.stroke').classList.add('active');

      // this.replaceConsultation(currentTarget);
      this.fetchConsultations(currentTarget);
    }
  }

  // replaceConsultation(currentTarget) {
  //   const ids = JSON.parse(currentTarget.dataset.consultationIds);

  //   fetch(`/fetch_consultation?consultation_ids=${ids}`, {
  //     Accept: 'application/json',
  //   })
  //     .then((response) => response.json())
  //     .then((data) => (this.circlesTarget.innerHTML = data.html));
  // }

  async fetchConsultations(currentTarget) {
    const ids = JSON.parse(currentTarget.dataset.consultationIds);
    // prettier-ignore
    const response = await fetch(`/fetch_consultations?consultation_ids=${ids}`, { Accept: 'application/json' });
    const data = await response.json();
    this.circlesTarget.innerHTML = data.html;
  }
}
