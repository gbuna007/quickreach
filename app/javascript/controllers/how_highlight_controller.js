import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="how-highlight"
export default class extends Controller {
  static targets = ["description", "card", "image"]

  connect() {
    console.log("how highlight connected");
  }

  update(e) {
    this.cardTargets.forEach(ele => ele.classList.remove("active"))
    const id = e.currentTarget.dataset.id;
    switch(id) {
      case "1":
        const desc1 = "<p>We have existing integration available with world's major CRMs: Salesforce, Hubspot, Zoho, and Sugar CRM.</p><p>As the data is synced with your CRM, any updates within CRM will be reflected on QuickReach.</p>"
        this.descriptionTarget.innerHTML = desc1;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-how' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/int_how.png'>"
        break;
      case "2":
        const desc2 = "<p>You understand how to communicate with your clients best.</p>\
        <p>QuickReach allows you to import your sales email templates into the system.</p>"
        this.descriptionTarget.innerHTML = desc2;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-how' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/template_how.png'>"
        break;
      case "3":
        const desc3 = "<p>Triggers will automate the news matching and targeting.</p>\
        <p>You will be able to create triggers to fit specific outreach needs including specifiying keywords what are relevant to the outreach strategy.</p>"
        this.descriptionTarget.innerHTML = desc3;
        e.currentTarget.classList.add("active")
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-how' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/trigger.png'>"
        break;
      case "4":
        const desc4 = "<p>Once a draft has been created, you will be able to review the draft before sending incase there are any adjustments needed.</p>"
        this.descriptionTarget.innerHTML = desc4;
        e.currentTarget.classList.add("active");
        this.imageTarget.innerHTML = "<img width='300' height='250' class='highlight-image-how' src='http://res.cloudinary.com/twx-a/image/upload/c_fill,h_225,w_275/read_how.png'>";
        break;
    }
  }
}
