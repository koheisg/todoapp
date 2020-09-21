import { Controller } from "stimulus"
import Rails from '@rails/ujs'

export default class extends Controller {
  connect() {
    this.data.set("count", 1)
  }

  load() {
    const elem = document.documentElement;
    const scrollBottom = elem.scrollHeight - elem.scrollTop - elem.clientHeight;
    const page = this.data.get('count')
    if (scrollBottom === 0) {
      const url = this.data.get("url")
      Rails.ajax({type: "GET", url: `${url}.js?page=${page}`})
      this.data.set("count", parseInt(page) + 1)
    }
  }
}
