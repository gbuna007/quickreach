import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-template"
export default class extends Controller {
  static targets = ["rows", "form"]

  connect() {
    console.log("new_template controller connected");
  }

  revealForm() {
    this.formTarget.classList.toggle("d-none")
  }
}
