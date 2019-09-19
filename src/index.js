const $ = require('jquery');
window.$ = $;
window.jQuery = $;
require('jsonform');

const fs = require("fs");

let schema = JSON.parse(fs.readFileSync("bayes-alread-schema/alread-schema.json").toString());

form = $('<form id="main"></form>');
form.jsonForm({
  schema: schema,
  onSubmit: function (errors, values) {
    if (errors) {
      $('#res').html('<p>I beg your pardon?</p>');
    }
    else {
      alert(JSON.stringify(values, null, 2));
    }
  }
});

$(function (){
    $("body").append(form);
})
