import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {
    static targets = ["button"]

    connect() {

    }

    trigger(event) {
        console.log("helllo")
        this.buttonTargets.forEach((button) => {
            button.classList.remove("status-active")
        })
        console.log(event.currentTarget)
        event.currentTarget.classList.add("status-active")
    }

}
