// #create a function, it will select the slider inputelement, add event listener to event, onchange, update the content of a div, id="budgetJs" change inner html
const initSlider = () => {
  const slidey = document.getElementById("test-slidey");
  if (!slidey) {
    return
  }
  slidey.addEventListener("change", (event) => {
    const slideyyy = document.getElementById("budgetJs")
    slideyyy.innerHTML = event.currentTarget.value;

    console.log(event.currentTarget.value);
  });
};

export { initSlider };
