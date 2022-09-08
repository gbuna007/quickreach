import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-contacts"
export default class extends Controller {
  // only the selection target exists rn
  static targets = ["selection", "contact", "contactform"]

  connect() {
    console.log("filter contacts connected");
  }

  select(e) {
    console.log(e.target.options[e.target.selectedIndex].text) // grab / gojek
    const account = e.target.options[e.target.selectedIndex].text
    this.contactTarget.innerHTML = ""

    fetch(`/filter_contacts_by_accounts?account=${account}`, {
        method: "GET",
        headers: { "Accept": "application/json" }
      })
      .then(response => response.json())
      .then(({contacts}) => {
        // insert the new contacts
        contacts.forEach(contact => {
          this.contactTarget.insertAdjacentHTML("beforeend", `<option value="${contact.id}">${contact.first_name} ${contact.last_name} - ${contact.title}</option>`)
        })
        // show the input
        this.contactformTarget.classList.remove('d-none')
      })
  }
}
