import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="flashes"
export default class extends Controller {
    static targets = ["alert"]

    connect() {
        const alert = this.alertTarget
        if (alert) {
            console.log(alert)
            this.alertRemove(alert)
        }
    }

    alertRemove(alert) {
        setTimeout(() => {
            alert.remove()
        }, 2000)
    }
}
