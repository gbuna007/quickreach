import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="why-highlight"
export default class extends Controller {
  static targets = ["description"]

  connect() {
    console.log("why highlight connected");
    // console.log(this.descriptionTarget.innerHTML);
  }

  update(e) {
    console.log(e.currentTarget.dataset.id);
    const id = e.currentTarget.dataset.id;
    switch(id) {
      case "1":
        const desc1 = "<p>Quickly reach out to relevant accounts and contacts throough your CRM as source-of-truth.</p>\
        <p>As the data is synced with your CRM, any updates within CRM will be reflected on QuickReach.</p>"
        console.log(desc1);
        this.descriptionTarget.innerHTML = desc1;
        break;
      case "2":
        const desc2 = "<p>Process of reading breaking news, deciding their relevancy, and drafting emails is repetitive and takes a lot of time.</p>\
        <p>Through automation QuickReach will enable you to focus on high-value activities such as speaking to your clients and prospects.</p>"
        console.log(desc2);
        this.descriptionTarget.innerHTML = desc2;
        break;
      case "3":
        const desc3 = "<p>yyyyy.</p>\
        <p>yyyyy.</p>"
        console.log(desc3);
        this.descriptionTarget.innerHTML = desc3;
        break;
      case "4":
        const desc4 = "<p>zzzzzz.</p>\
        <p>zzzz.</p>"
        console.log(desc4);
        this.descriptionTarget.innerHTML = desc4;
        break;
    }
  }
}