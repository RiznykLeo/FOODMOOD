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

    submitDelete() {
        console.log(this.formTarget)
        this.deleteForm()
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
                console.log(data)
                document.querySelector('#alerts').outerHTML = data;
            })
    }

    deleteForm() {
        const url = this.formTarget.action
        console.log(this.formTarget)
        fetch(
            url,
            {
                method: 'DELETE',
                headers: {Accept: 'text/plain'},
                // headers: { Accept: 'application/json' },
                body: new FormData(this.formTarget)
            }
        ).then(response => response.text())
            .then(data => {
                console.log(data)
                document.querySelector('#alerts').outerHTML = data;
            })
    }

    trigger(event) {
        console.log(this.buttonTargets)
        this.formTargets.forEach((form) => {
            form.classList.remove("status-active")
            console.log(form.classList)

        })
        console.log(event.currentTarget)
        event.currentTarget.classList.add("status-active")
        // this.submitForm()
    }

}
