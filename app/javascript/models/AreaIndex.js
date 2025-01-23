import $ from "jquery";
import * as bootstrap from "bootstrap";
import Mustache from "mustache";

var $btnNew;
var $modalNew;
var $btnSave;
var $areaName;
var $areaShortName;

var _cacheDom = function() {

  $btnNew = $("#btn-new");
  $btnSave = $("#btn-save");
  $modalNew = new bootstrap.Modal(document.getElementById("modal-new"));

  $areaName = $("#area-name");
  $areaShortName = $("#area-shortname");
};

var _bindEvents = function() {
  $btnNew.on("click",function(){
    $modalNew.show();
  });

  $btnSave.on("click", function(){
    var data = {
      area_name: $areaName.val(),
      area_shortname: $areaShortName.val(),
      authenticity_token: authenticityToken
    }
    

    $.ajax({
      url: "/admin/create_area",
      method: "POST",
      data: data,
      success: function(response){
        window.location.reload();
      },
      error: function(response){
        alert("ERROR SAVING");
      }
    });

  });
 

};




var init  = function(config) {
  authenticityToken = config.authenticityToken;

  _cacheDom();
  _bindEvents();
}

export default { init: init };
