import $ from "jquery";
import * as bootstrap from "bootstrap";
import Mustache from "mustache";

var $btnNew;
var $modalNew;
var $btnSave;
var $jobLevelName;
var $SelectKSO;

var _cacheDom = function() {

  $btnNew = $("#btn-new");
  $btnSave = $("#btn-save");
  $jobLevelName = $("#job-level-name");
  $SelectKSO = $("#select-kso");
  $modalNew = new bootstrap.Modal(document.getElementById("modal-new"));
};

var _bindEvents = function() {
  $btnNew.on("click",function(){
    $modalNew.show();
  });

  $btnSave.on("click", function(){
    var data = {
      job_level_name: $jobLevelName.val(),
      select_kso: $SelectKSO.val(),
      authenticity_token: authenticityToken
    }
    
    console.log(data);
    $.ajax({
      url: "/admin/create_job_levels",
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
