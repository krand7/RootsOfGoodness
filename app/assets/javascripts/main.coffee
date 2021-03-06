@mainLoader = () ->
  $(document.links).filter(() ->
    return this.hostname != window.location.hostname
  ).attr('target', '_blank')

  $('[data-toggle="tooltip"]').tooltip()

@loaders = () ->
  mainLoader()
  receiverLoader() if $('[data-object~="receiver-name-typeahead"]').length > 0
  actionLoader()

$(document).ready(loaders)
$(document)
  .on('page:load', loaders)

