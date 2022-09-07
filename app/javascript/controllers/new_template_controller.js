import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-template"
export default class extends Controller {
  static targets = ["rows", "form", "submit"]

  connect() {
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

    // goes to routes --> templates#create
    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json"  },
      body: new FormData(this.submitTarget)
    })
      .then(response => response.json())
      .then((data) => { // data is what is returned by create.json.jbuilder
        // replace the old form with a new one / the old one with errors
        this.submitTarget.outerHTML = data.form

        if (data.inserted_item) { // if template is saved (form is submitted properly)
          this.rowsTarget.insertAdjacentHTML("beforeend", data.inserted_item)
        } else {
          // means there are errors
          this.formTarget.classList.remove("d-none")
        }
      })
  }
}
