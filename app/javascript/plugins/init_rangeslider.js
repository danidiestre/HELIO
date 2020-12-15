import rangesliderJs from 'rangeslider-js'

const initSlider = () => {
  const inputs = document.querySelectorAll('input[type="range"]');
  if (inputs && inputs.length > 0) {
    rangesliderJs.create(inputs,
      {
        min: 40,
        max: 120,
        value: 60,
        step: 5,
        onSlide: (value, position) => {
          document.getElementById("budgetJs").innerText = value
        }
      }
    )
  }
};

export { initSlider };
