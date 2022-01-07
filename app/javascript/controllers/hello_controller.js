import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  test(){
    console.log("run test")
  }
  connect() {
    console.log("connected")
    //this one works document.getElementById('testButton').addEventListener("click", this.test);
    //$('#testButton').on('click', () => this.test())
  }
}
