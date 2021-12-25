import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "container" ]
  static values = { url: String }

  connect() {
    this.add();
  }

  add() {
    fetch(this.urlValue)
      .then(response => response.text())
      .then(html => {
        const div = document.createElement('DIV');
        div.innerHTML = html;
        this.containerTarget.appendChild(div);
        this.numberValue++;
      });
  }
}
