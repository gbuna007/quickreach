import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="why-highlight"
export default class extends Controller {
  connect() {
    console.log("why highlight connected");
  }
}
