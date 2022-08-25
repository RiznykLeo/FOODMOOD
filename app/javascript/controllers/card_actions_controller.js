import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-actions"
export default class extends Controller {
  connect() {
    console.log("connected")
  }

  removeCard() {
    this.element.remove()
  }
}
