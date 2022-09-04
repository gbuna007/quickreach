import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-contacts"
export default class extends Controller {
  static targets = ["selection"]

  connect() {
    console.log("filter contacts connected");
    console.log(this.selectionTarget);
  }

  select(e) {
    console.log("TODO: send request in AJAX")
  }
}
