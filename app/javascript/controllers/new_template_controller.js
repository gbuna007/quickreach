import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-template"
export default class extends Controller {
  static targets = ["rows", "form", "submit"]

  connect() {
    console.log("new_template controller connected");
  }

  // user click new template to show the form
  revealForm() {
    this.formTarget.classList.toggle("d-none")
  }

  // a request will be sent to create the template once user submits the form
  create(event) {
    console.log("AJAX Request");
    event.preventDefault();
    const url = this.submitTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "*/*" },
      body: new FormData(this.submitTarget)
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
      })
  }
}
