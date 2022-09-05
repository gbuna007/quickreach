import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-trigger"
export default class extends Controller {
  static targets = ["rows", "form", "submit"]

  connect() {
    console.log("new_trigger controller connected");
  }

  revealForm() {
    this.formTarget.classList.toggle("d-none")
  }

  create(event) {
    event.preventDefault();
    this.formTarget.classList.toggle("d-none")
  }
}
