import flatpickr from "flatpickr"
import { Russian } from "flatpickr/dist/l10n/ru.js"

flatpickr(".flatpickr", {
  enableTime: true,
  dateFormat: "Y-m-d H:i",
  locale: Russian,
  time_24hr: true
})
