import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'list', 'input']

  connect() {
    // console.log(this.formTarget)
    // console.log(this.listTarget)
    // console.log(this.inputTarget)
  }

  async update(event) {
    event.preventDefault();
    const url = `/timeline?query=${this.inputTarget.value}`

    const response = await fetch(url, { headers: { 'Accept': 'text/plain' } });
    const data = await response.text();
    this.listTarget.innerHTML = data
  }
}