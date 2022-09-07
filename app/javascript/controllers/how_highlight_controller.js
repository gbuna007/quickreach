import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="how-highlight"
export default class extends Controller {
  static targets = ["description"]

  connect() {
    console.log("how highlight connected");
  }

  update(e) {
    console.log(e.currentTarget.dataset.id);
    const id = e.currentTarget.dataset.id;
    switch(id) {
      case "1":
        const desc1 = "<p>We have existing integration available with world's major CRMs: Salesforce, Hubspot, Zoho, and Sugar CRM.</p>"
        console.log(desc1);
        this.descriptionTarget.innerHTML = desc1;
        break;
      case "2":
        const desc2 = "<p>aaaaaaaaa.</p>\
        <p>aaaaaaa.</p>"
        console.log(desc2);
        this.descriptionTarget.innerHTML = desc2;
        break;
      case "3":
        const desc3 = "<p>bbbbbbb.</p>\
        <p>bbbbbbbb.</p>"
        console.log(desc3);
        this.descriptionTarget.innerHTML = desc3;
        break;
      case "4":
        const desc4 = "<p>ccccccc.</p>\
        <p>ccccccc.</p>"
        console.log(desc4);
        this.descriptionTarget.innerHTML = desc4;
        break;
    }
  }
}
