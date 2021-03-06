import flatpickr from "flatpickr";

// Check that the query selector id matches the one you put around your form.
const initFlatpickr=()=> {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  if (startDateInput) {
  const unavailableDates = JSON.parse(document.querySelector('#buddy-booking-dates').dataset.unavailable)
  endDateInput.disabled = true

  flatpickr(startDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
    altInput: true
  });

  console.log('im in the file')

  startDateInput.addEventListener("change", (e) => {
    if (startDateInput != "") {
      endDateInput.disabled = false
    }
    flatpickr(endDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d",
      altInput: true
      });
    })
  };
}

export {initFlatpickr}
