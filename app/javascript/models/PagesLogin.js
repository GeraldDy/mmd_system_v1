import $ from "jquery";
import * as bootstrap from "bootstrap";
import Mustache from "mustache";

var authenticityToken;
var $btnLogin;
var $email;
var $password;
var $message;
let isLoading         = false;

var _cacheDom = function() {
  $btnLogin = document.querySelector("#btn-login");
  $email = document.querySelector("#input-username");
  $password = document.querySelector("#input-password");
};

var _bindEvents = function() {
  $btnLogin.addEventListener("click", function() {
    const data = {
      username: $email.value,
      password: $password.value,
      authenticity_token: authenticityToken
    }

     _toggleInput();
     $.ajax({
      url: "/user_login",
      data: data,
      method: "POST",
      success: function(response) {    
        window.location.href = "/";
      },
      error: function(response) {
          alert("LOGIN FAILED");   
          _toggleInput();
      }
     });
  });

};

var _toggleInput = function() {
  isLoading = !isLoading;
  $email.disabled = isLoading;
  $password.disabled = isLoading;
  $btnLogin.disabled      = isLoading;
};


var init  = function(config) {
  authenticityToken = config.authenticityToken;

  _cacheDom();
  _bindEvents();
}

export default { init: init };
