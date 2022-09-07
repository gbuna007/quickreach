import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="how-highlight"
export default class extends Controller {
  static targets = ["description", "card"]

  connect() {
    console.log("how highlight connected");
  }

  update(e) {
    this.cardTargets.forEach(ele => ele.classList.remove("active"))
    const id = e.currentTarget.dataset.id;
    switch(id) {
      case "1":
        const desc1 = "<p>We have existing integration available with world's major CRMs: Salesforce, Hubspot, Zoho, and Sugar CRM.</p>"
        this.descriptionTarget.innerHTML = desc1;
        e.currentTarget.classList.add("active")
        break;
      case "2":
        const desc2 = "<p>aaaaaaaaa.</p>\
        <p>aaaaaaa.</p>"
        this.descriptionTarget.innerHTML = desc2;
        e.currentTarget.classList.add("active")
        break;
      case "3":
        const desc3 = "<p>bbbbbbb.</p>\
        <p>bbbbbbbb.</p>"
        this.descriptionTarget.innerHTML = desc3;
        e.currentTarget.classList.add("active")
        break;
      case "4":
        const desc4 = "<p>ccccccc.</p>\
        <p>ccccccc.</p>"
        this.descriptionTarget.innerHTML = desc4;
        e.currentTarget.classList.add("active")
        break;
    }
  }
}
