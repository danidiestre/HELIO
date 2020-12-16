const readMore = () => {
  const button = document.querySelector(".read-more");
  const element = document.getElementById("event-description");


  button.addEventListener("click", (event) => {
    const description = element.dataset.description;
    element.dataset.description = element.innerText
    element.innerHTML = description;
    if ( button.innerHTML === "Read more" ) {
      button.innerHTML = "Read less"
    } else {
      button.innerHTML = "Read more";
    }
  })
}

export { readMore };
