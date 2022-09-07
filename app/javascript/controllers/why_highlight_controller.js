import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="why-highlight"
export default class extends Controller {
  static targets = ["description", "card"]

  connect() {
  }

  update(e) {
    this.cardTargets.forEach(ele => ele.classList.remove("active"))
    const id = e.currentTarget.dataset.id;
    switch(id) {
      case "1":
        const desc1 = "<p>Quickly reach out to relevant accounts and contacts throough your CRM as source-of-truth.</p>\
        <p>As the data is synced with your CRM, any updates within CRM will be reflected on QuickReach.</p>"
        this.descriptionTarget.innerHTML = desc1;
        e.currentTarget.classList.add("active")
        break;
      case "2":
        const desc2 = "<p>Process of reading breaking news, deciding their relevancy, and drafting emails is repetitive and takes a lot of time.</p>\
        <p>Through automation QuickReach will enable you to focus on high-value activities such as speaking to your clients and prospects.</p>"
        this.descriptionTarget.innerHTML = desc2;
        e.currentTarget.classList.add("active")
        break;
      case "3":
        const desc3 = "<p>Delegate news research to us.</p>\
        <p>Our system will check for any breaking news every 5 minutes.</p>"
        this.descriptionTarget.innerHTML = desc3;
        e.currentTarget.classList.add("active")
        break;
      case "4":
        const desc4 = "<p>When there is a relevant breaking news, QuickReach will generate a draft and notify you</p>\
        <p>Drafts will be pre-polulated with the right information and are ready to send after a <2 mins review.</p>"
        this.descriptionTarget.innerHTML = desc4;
        e.currentTarget.classList.add("active")
        break;
    }
  }
}
