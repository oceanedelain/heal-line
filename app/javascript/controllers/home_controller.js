import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['stroke']

  connect() {
    console.log('home controller');
  }

  center({currentTarget}) {
    if (currentTarget.dataset.consultation === 'true') {
       currentTarget.scrollIntoView({ behavior: "smooth", block: "start", inline: "center" });
       this.strokeTargets.forEach(item => item.classList.remove('active'))
       currentTarget.querySelector('.stroke').classList.add('active')
       this.fetchAppointment(currentTarget);
    }
  }

  async fetchAppointment(currentTarget) {
    const ids = JSON.parse(currentTarget.dataset.consultationIds)

    const response = await fetch(`/fetch_consultation?consultation_id=${ids[0]}`, { 'Accept': "application/json" });
    const data = await response.json();
    console.log(data)
  }
}
