import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['form', 'list', 'documents', 'input']

  async update(event) {
    event.preventDefault();
    const url = `/timeline?query=${this.inputTarget.value}`

    const response = await fetch(url, { headers: { 'Accept': 'text/plain' } });
    const data = await response.text();
    this.listTarget.innerHTML = data
  }

  async searchDoc(event) {
    event.preventDefault();

    const url = `/documents?query=${this.inputTarget.value}`

    const response = await fetch(url, { headers: { 'Accept': 'text/plain' } });
    const data = await response.text();
    this.documentsTarget.innerHTML = data
  }


}
