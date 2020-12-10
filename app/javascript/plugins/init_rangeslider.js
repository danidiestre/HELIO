import "rangeslider.js"

const initSlider = () => {
    $('input[type="range"]').rangeslider({ 
      polyfill: false,
      onSlide: (position, value) => {
        document.getElementById("budgetJs").innerText = value
      }
    });

    
  };
  
  export { initSlider };