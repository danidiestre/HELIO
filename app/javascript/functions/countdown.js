const updateCountDown = (element) => {
  const countDownDate = Date.parse(element.dataset.startDate);
  const now = Date.now();

  const distance = countDownDate - now;

  const days = Math.floor(distance / (1000 * 60 * 60 * 24));
  const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);

  element.querySelector(".days").innerHTML = "<h6 class='days'>" + days + "d</h6>";
  element.querySelector(".time").innerHTML = "<h5><strong class='time'>" + hours + ":" + minutes +"</strong></h5>";
  element.querySelector(".seconds").innerHTML = "<h6 class='seconds'>" + seconds + "s</h6>";
}

const countDown = () => {
  const elements = document.querySelectorAll(".countdown");
  if (elements.length > 0) {
    elements.forEach((element) => {
      setInterval(updateCountDown, 1000, element)
    });
  };
};

export { countDown };

// iterate over elements
// retrieve start date of elements from dataset
// turn the start date into a date object
// compare it to dates.now

