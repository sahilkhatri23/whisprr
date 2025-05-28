import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  submitEnd(event) {
    if (event.detail.success) {
      this.element.innerHTML = "";
      document.body.classList.remove("overflow-hidden");
    }
  }
}
