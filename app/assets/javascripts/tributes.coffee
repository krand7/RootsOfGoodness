# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document)
  .on('load', () ->
    $("#number_of_trees_value").html '$' + $('#number_of_trees_input').val()
  )
  .on('input', '#number_of_trees_input', () ->
    $("#number_of_trees_value").html '$' + $(this).val()
  )
