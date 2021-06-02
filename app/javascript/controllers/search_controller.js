import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['form', 'list', 'documents', 'input', 'choice'];

  async update(event) {
    event.preventDefault();

    let url = `/timeline?query=${this.inputTarget.value}`;
    if (this.choiceTarget.value !== '') {
      url += `&choice=${this.choiceTarget.value}`;
    }

    const response = await fetch(url, { headers: { Accept: 'text/plain' } });
    const data = await response.text();
    this.listTarget.innerHTML = data;
  }

  async searchDoc(event) {
    event.preventDefault();

    const url = `/documents?query=${this.inputTarget.value}`;

    const response = await fetch(url, { headers: { Accept: 'text/plain' } });
    const data = await response.text();
    this.documentsTarget.innerHTML = data;
  }
}
