import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
    static targets = ["content"]

    connect() {
        console.log("hello")
    }

    collapse(event) {
        console.log(event)
        const element = this.contentTarget
        element.classList.toggle("accordion-active")
    }
}
