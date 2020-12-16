const readMore = () => {
  const button = document.querySelector(".read-more");
  const element = document.getElementById("event-description");
  const description = element.dataset.description;

  button.addEeventListener("click", (element1) => {
    element1.innerHTML = description
  })
}

export { readMore };
