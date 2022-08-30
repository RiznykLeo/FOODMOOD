import {Controller} from "@hotwired/stimulus"
import * as Swing from 'swing'
// Connects to data-controller="swinger"
export default class extends Controller {
    static targets = ["card", "form", "counter"]

    connect() {
        this.cards = [].slice.call(this.cardTargets)

        const stack = Swing.Stack()

        this.cards.forEach((targetElement) => {
            stack.createCard(targetElement)
        })

        stack.on('throwout', (event) => {
            const swingItem = event.target
            swingItem.classList.add('d-none')
            this.isLiked(event.throwDirection == Swing.Direction.RIGHT, swingItem)
        })

        stack.on('throwin', (event) => {
            console.log('Card snapped back to the stack.')
            const swingItem = event.target
            swingItem.classList.remove('d-none')
        })

    }

    choose(event) {
        event.preventDefault()
        const swingItem = event.currentTarget.parentElement.parentElement
        swingItem.classList.add('d-none')
        this.isLiked(event.params.like, swingItem)
    }

    isLiked(like, item) {
        console.log(`This card ${item.class} was ${like ? 'liked' : 'noped'}`)
        if (like) {
            this.submitForm(item)
        }
        item.remove()
    }

    submitForm(item) {
        const form = item.querySelector("form")
        const url = form.action
        console.log(form)
        fetch(
            url,
            {
                method: 'POST',
                headers: {Accept: 'text/plain'},
                // headers: { Accept: 'application/json' },
                body: new FormData(form)
            }
        ).then(response => response.text())
            .then(data => {
                this.counterTargets.forEach((counter) => {
                    counter.innerText = parseInt(counter.innerText, 10) + 1
                })
                console.log(data)
                document.querySelector('#alerts').outerHTML = data;
            })
    }
}
