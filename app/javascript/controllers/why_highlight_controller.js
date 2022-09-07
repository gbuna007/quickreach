import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="why-highlight"
export default class extends Controller {
  static targets = ["description", "card", "image"]

  connect() {
  }

  update(e) {
    this.cardTargets.forEach(ele => ele.classList.remove("active"))
    const id = e.currentTarget.dataset.id;
    switch(id) {
      case "1":
        const desc1 = "<p>Quickly reach out to relevant accounts and contacts through your CRM as source-of-truth.</p>\
        <p>As the data is synced with your CRM, any updates within CRM will be reflected on QuickReach.</p>"
        this.descriptionTarget.innerHTML = desc1;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-why' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/integrate_crm.png'>"
        break;
      case "2":
        const desc2 = "<p>Process of reading breaking news, deciding their relevancy, and drafting emails is repetitive and takes a lot of time.</p>\
        <p>Through automation QuickReach will enable you to focus on high-value activities such as speaking to your clients and prospects.</p>"
        this.descriptionTarget.innerHTML = desc2;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-why' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/automate_news.png'>"
        break;
      case "3":
        const desc3 = "<p>Delegate news research to us.</p>\
        <p>Our system is connected to top global and regional publications and will check for any breaking news every 5 minutes.</p>"
        this.descriptionTarget.innerHTML = desc3;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-why' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/newspaper.png'>"
        break;
      case "4":
        const desc4 = "<p>When there is a relevant breaking news, QuickReach will generate a draft and notify you</p>\
        <p>Drafts will be pre-polulated with the right information and are ready to send after a review.</p>"
        this.descriptionTarget.innerHTML = desc4;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-why' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/email.png'>"
        break;
    }
  }
}
