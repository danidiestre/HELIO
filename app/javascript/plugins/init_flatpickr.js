import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    mode: "range",
    dateFormat: "Y-m-d",
    inline: true
  });
};

export { initFlatpickr };
