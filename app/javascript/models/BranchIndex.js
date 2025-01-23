import $ from "jquery";
import * as bootstrap from "bootstrap";
import Mustache from "mustache";

var $btnNew;
var $modalNew;
var $btnSave;
var $branchName;
var $branchShortName;
var $selectCluster;

var _cacheDom = function() {

  $btnNew = $("#btn-new");
  $btnSave   = $("#btn-save");
  $branchName = $("#branch-name");
  $branchShortName = $("#branch-shortname");
  $selectCluster = $("#select-cluster");
  $modalNew = new bootstrap.Modal(document.getElementById("modal-new"));

};

var _bindEvents = function() {
  $btnNew.on("click",function(){
    $modalNew.show();
  });

  $btnSave.on("click", function(){
    var data = {
      branch_name: $branchName.val(),
      branch_shortname: $branchShortName.val(),
      selected_cluster: $selectCluster.val(),
      authenticity_token: authenticityToken
    }
    console.log(data);
    

    $.ajax({
      url: "/admin/create_branch",
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
