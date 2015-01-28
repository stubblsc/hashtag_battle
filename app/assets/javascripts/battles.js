// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
function set_color(){
  if(parseInt($("#brand1").text()) < parseInt($("#brand2").text())){
    $("#brand1_count").css("background-color", "red");
    $("#brand2_count").css("background-color", "green");
  }else if(parseInt($("#brand1").text()) > parseInt($("#brand2").text())){
    $("#brand2_count").css("background-color", "red");
    $("#brand1_count").css("background-color", "green");
  }else{
    $("#brand1_count").css("background-color", "yellow");
    $("#brand2_count").css("background-color", "yellow");
  }
}

function update(){
  set_color();
  var battle_id = $("#brand1_count").attr("data-battle-id");
  $.getScript("/battles/update.js?id="+battle_id);
  set_color();
  setTimeout(update, 500);
}
