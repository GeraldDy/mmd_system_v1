import $ from "jquery";
import * as bootstrap from "bootstrap";
import Mustache from "mustache";

var $btnNew;
var $modalNew;
var $btnSave;
var $clusterName;
var $clusterShortName;
var $selectArea;

var _cacheDom = function() {

  $btnNew = $("#btn-new");
  $clusterName = $("#cluster-name")
  $clusterShortName = $("#cluster-shortname");
  $selectArea = $("#select-area");
  $btnSave   = $("#btn-save");
  $modalNew = new bootstrap.Modal(document.getElementById("modal-new"));

};

var _bindEvents = function() {
  $btnNew.on("click",function(){
    $modalNew.show();
  });

  $btnSave.on("click", function(){
    var data = {
      cluster_name: $clusterName.val(),
      cluster_shortname: $clusterShortName.val(),
      selected_area: $selectArea.val(),
      authenticity_token: authenticityToken
    }
    console.log(data);
    

    $.ajax({
      url: "/admin/create_cluster",
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
