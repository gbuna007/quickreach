import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keywords-for-trigger"
export default class extends Controller {
  static targets = ["form"]
  connect() {
    console.log("Hello from keywords kontoller")
  }

  addKeys(e){
    e.preventDefault();

    console.log("Trying to create keys..")
  }

}
