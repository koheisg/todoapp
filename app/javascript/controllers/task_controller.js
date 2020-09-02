import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", 'text', 'input' ]

  show() {
    this.textTarget.classList.remove("hide")
    this.formTarget.classList.add("hide")
  }

  edit() {
    this.formTarget.classList.remove("hide")
    this.textTarget.classList.add("hide")
    this.inputTarget.focus()
  }

  loading() {
    this.textTarget.classList.remove("hide")
    this.formTarget.classList.add("hide")
  }

  complete(){
    this.textTarget.classList.remove("hide")
    this.formTarget.classList.add("hide")
  }
}
