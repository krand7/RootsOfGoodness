# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@receiverLoader = () ->

  @receivers = new Bloodhound (
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value')
    queryTokenizer: Bloodhound.tokenizers.whitespace
    local: $.map($("#existing_receiver_names").data("local"), (receiver) -> { value: receiver })
  )

  @receivers.initialize()

  $('[data-object~="receiver-name-typeahead"]').each( () ->
    $this = $(this)
    $("#receiver_name").typeahead( null,
      name: 'receivers'
      displayKey: 'value'
      source: receivers.ttAdapter()
    )
  )