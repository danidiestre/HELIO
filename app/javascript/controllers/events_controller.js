import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "listItems" ]

    filter(e) {
        if (this.categories.includes(e.target.dataset.category)){
            this.categories = this.categories.filter((value) => {
               return value != e.target.dataset.category
            })
            e.target.style.backgroundColor = '#F4F4F4'
            e.target.style.color = '#01a0ba'

            
        }else{
            this.categories.push(e.target.dataset.category)
            e.target.style.backgroundColor = '#01a0ba'
            e.target.style.color = 'white'
            

        }

        if (this.categories.length === 0) {
            this.reset()
        } else {
            this.hideItems()

        }
        
        console.log(this.categories)

    }

    hideItems() {
        this.listItemsTargets.forEach(item => {
            if (this.categories.includes(item.dataset.category)) {
                item.classList.remove("hide-item")
            } else {
                item.classList.add("hide-item")

            }
        })
    }

    reset(){
        this.listItemsTargets.forEach(item => {
            item.classList.remove("hide-item")
        })
    }
    

    initialize() {
        this.categories = []
    }
}