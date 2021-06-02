import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['stroke', 'circles']

  initialize() {
    this.observer = new IntersectionObserver(this.manageObservables.bind(this), { rootMargin: '-160px' })
    this.strokeTargets.forEach((item) => this.observer.observe(item));
  }

  center({currentTarget}) {
    if (currentTarget.dataset.consultation === 'true') {
      currentTarget.scrollIntoView({ behavior: "smooth", block: "start", inline: "center" });
      this.strokeTargets.forEach(item => item.classList.remove('active'))
      currentTarget.querySelector('.stroke').classList.add('active');
      this.fetchAppointment(currentTarget);
      // this.replaceConsultation(currentTarget)
    }
  }

  manageObservables(observables) {
    observables.forEach(this.intersection);
  }

  intersection(observable) {
    const isIntersecting = observable.isIntersecting;

    if (isIntersecting) {
      const day = observable.target.closest('.day');

      if (day.dataset.consultation === 'true') {
        day.click();
      }
    } else {
      observable.target.classList.remove('active');
    }
  }

  // replaceConsultation(currentTarget) {
  //   const ids = JSON.parse(currentTarget.dataset.consultationIds);
  //   fetch(`/fetch_consultation?consultation_id=${ids[0]}`,
  //     { 'Accept': "application/json" }
  //   )
  //   .then(response => response.json())
  //   .then(data => this.consultationCircleTarget.outerHTML = data.consultation_html)
  // }

  async fetchAppointment(currentTarget) {
    const ids = JSON.parse(currentTarget.dataset.consultationIds)
    const response = await fetch(`/fetch_consultation?consultation_ids=${ids}`, { 'Accept': "application/json" });
    const data = await response.json();
    this.circlesTarget.innerHTML = data.html
  }
}
