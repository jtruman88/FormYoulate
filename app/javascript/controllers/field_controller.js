import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "typeSelect", "type" ]
  static values = { updateTypeUrl: String }

  updateType() {
    fetch(`${this.updateTypeUrlValue}?type=${this.typeSelectTarget.value}`)
      .then(response => response.text())
      .then(html => this.typeTarget.innerHTML = html);
  }
}
