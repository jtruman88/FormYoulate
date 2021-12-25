import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'container' ]
  static values = { url: String, type: Number }

  add() {
    fetch(`${this.urlValue}?type=${this.typeValue}`)
      .then(response => response.text())
      .then(html => {
        const div = document.createElement('DIV');
        div.innerHTML = html;
        this.containerTarget.appendChild(div);
      });
  }
}
