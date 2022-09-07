import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="keywords"
export default class extends Controller {
  static targets = ["formkey", "keydisplay"]

  connect() {
    console.log("keywords controller connected");
  }

  createKeyword(event){
    event.preventDefault();
    console.log("keyword created")
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
