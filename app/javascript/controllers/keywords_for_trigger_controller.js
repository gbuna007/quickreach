import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keywords-for-trigger"
export default class extends Controller {
  static targets = ["formkey", "keydisplay"]
  connect() {
    console.log(this.element)
    console.log(this.formkeyTarget)
    console.log(this.keydisplayTarget)
  }

  createKey(event){
    event.preventDefault();

    console.log(this.formkey.action)
    // console.log("creating data..")
    // fetch(this.formkeyTarget.action, {
    //   method: "POST",
    //   headers: { "Accept": "application/json" },
    //   body: new FormData(this.formkeyTarget)
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })

  }
}
