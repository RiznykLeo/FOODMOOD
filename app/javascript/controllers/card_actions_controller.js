import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="card-actions"
export default class extends Controller {
    static targets = ["form", "button"]

    connect() {
        console.log("connected")
    }

    removeCard() {
        this.element.remove()
    }

    submitRemove() {
        console.log(this.formTarget)
        this.submitForm()
        this.removeCard()
    }

    submitForm() {
        const url = this.formTarget.action
        fetch(
            url,
            {
                method: 'PATCH',
                headers: {Accept: 'text/plain'},
                // headers: { Accept: 'application/json' },
                body: new FormData(this.formTarget)
            }
        ).then(response => response.text())
            .then(data => {
            })
    }

    trigger(event) {
        console.log("helllo")
        this.buttonTargets.forEach((button) => {
            button.classList.remove("status-active")
        })
        console.log(event.currentTarget)
        event.currentTarget.classList.add("status-active")
        // this.submitForm()
    }

}
