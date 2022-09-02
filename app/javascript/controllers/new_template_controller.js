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
    event.preventDefault();
    this.formTarget.classList.toggle("d-none")
    const url = this.submitTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json"  },
      body: new FormData(this.submitTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.inserted_item) {
          this.rowsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        }
        this.submitTarget.outerHTML = data.form
      })
  }
}
