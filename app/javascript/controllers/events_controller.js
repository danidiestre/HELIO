import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "listItems" ]

    filter(e) {
        this.hideItems(e.target.dataset.category)
        console.log(e)
        
        e.target.classList ="button-clicked"
    }

    hideItems() {
        this.listItemsTargets.forEach(item => {
            if (item.dataset.category === category_id) {
                item.classList.remove("hide-item")
            } else {
                item.classList.add("hide-item")
            }
        })
    }



}