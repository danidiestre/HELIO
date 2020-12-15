const slider = () => {
  document.querySelectorAll('input[type="range"]'),
    {
      min: 40,
      max: 120,
      value: 60,
      step: 5,
      onSlide: (value, position) => {
        document.getElementById("budgetJs").innerText = value
      }
    }
}

export { slider };

