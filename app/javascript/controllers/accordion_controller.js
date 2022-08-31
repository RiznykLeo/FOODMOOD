import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="accordion"
export default class extends Controller {
    static targets = ["content", "arrow"]

    connect() {
    }

    collapse(event) {
        const element = this.contentTarget
        const arrow = this.arrowTarget
        element.classList.toggle("accordion-active")
        arrow.classList.toggle("rotated")
    }
}
