// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function () {

  citybee.accounts = {
    email: 'bhaarat.s@gmail.com',
    markasused: {
      deal_used : true
    },

    toggle: function (key,value) {
      citybee.accounts.markused[key] = value;
      citybee.accounts.update();
      
    }





  }
});
