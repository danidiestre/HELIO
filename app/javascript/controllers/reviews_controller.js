import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "stars" ]

    initialize() {
        this.rating = 5;
    }



    changeRating(e) {

        this.rating = parseInt(e.target.dataset.value, 10)
        console.log(this.rating)
        document.querySelector("#review_rating").value = this.rating
        this.starsTargets.forEach((item, index) => {
            console.log(item)
            
            if (this.rating >= index + 1){
                item.classList.add("checked")

            }else{
                item.classList.remove("checked")
            }

        })
        
    }
    

}
