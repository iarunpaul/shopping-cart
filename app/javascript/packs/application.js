// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bulma"
import "@fortawesome/fontawesome-free/css/all"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// window.addEventListener("load", () => {
//   const element = document.querySelector("form#new_item_form");
//   element.addEventListener("ajax:success", (event) => {
//     const [_data, _status, xhr] = event.detail;
//     alert(xhr.responseText);

//     element.insertAdjacentHTML("beforeend", "<p>DONE</p>");
//   });
//   element.addEventListener("ajax:error", () => {
//     element.insertAdjacentHTML("beforeend", "<p>ERROR</p>");
//   });
// });
