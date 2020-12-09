import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    mode: "range",
    dateFormat: "Y-m-d",
    maxDate: new Date().fp_incr(60)
  });
};

export { initFlatpickr };
