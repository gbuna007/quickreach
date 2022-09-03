import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keywords-for-trigger"
export default class extends Controller {
  static targets = ["formKeys", "keyDisplay"]
  connect() {
    console.log("Hello from keywords kontoller")
  }

  createKeys(e){
    e.preventDefault();

    console.log("Trying to create keys..")
  }

}
