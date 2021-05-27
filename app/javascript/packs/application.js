// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//calendar

import Moment from "momentjs-rails"
import Fullcalendar from "fullcalendar-rails"

Moment.start()
Fullcalendar.start()


function eventCalendar() {
  return $('#calendar').fullCalendar({});
};
function clearCalendar() {
  $('#calendar').fullCalendar('delete');
  $('#calendar').html('');
};


$(document).on('turbolinks:load', function () {
  eventCalendar();
});
$(document).on('turbolinks:before-cache', clearCalendar);

////////////////////

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()



// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initFlatpickr } from "../plugins/flatpickr";


// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { toggleTimelineCard } from '../components/timeline';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initFlatpickr();
  toggleTimelineCard();
});

