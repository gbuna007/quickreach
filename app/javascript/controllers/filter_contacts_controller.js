import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-contacts"
export default class extends Controller {
  static targets = ["selection", "contact"]

  connect() {
    console.log("filter contacts connected");
    console.log(this.selectionTarget);
    console.log(this.contactTarget);
  }

  select(e) {
    console.log(e.target.options[e.target.value].text) // grab / gojek
    const account = e.target.options[e.target.value].text
    this.contactTarget.innerHTML = ""

    fetch(`/filter_contacts_by_accounts?account=${account}`, {
        method: "GET",
        headers: { "Accept": "application/json" },
        // body: {"name": e.target.options[e.target.value].text}
      })
      .then(response => response.json())
      .then(({contacts}) => {
        // insert the new contacts
        contacts.forEach(contact => {
          this.contactTarget.insertAdjacentHTML("beforeend", `<option value="${contact.id}">${contact.first_name} ${contact.last_name} - ${contact.title}</option>`)
        })
        // show the input
        this.contactTarget.classList.remove('d-none')
      })
  }
}
