#= require jquery
#= require jquery_ujs

$ ->

  $('form.disableable').on 'submit', ->
    $('input[type=submit]').addClass('disabled').prop('disabled', true)
  
  addOverlay = (onClose)->
    $('div.overlay').remove()
    $("<div class='overlay'></div>").appendTo('body').on 'click', ->
      $(this).remove()
      onClose()
      
  
  $('div.product div.optionsBox div.links li.item.box a').on 'click', ->
    item = $('div.product div.optionsBox div.in_the_box').toggle()
    addOverlay -> item.hide()
    false
  
  toggleDeliveryAddress = ->
    if $('div.checkout input#order_separate_delivery_address').prop('checked')
      $('div.checkout dl.delivery').show()
    else
      $('div.checkout dl.delivery').hide()
    false
  $('div.checkout input#order_separate_delivery_address').on 'change', toggleDeliveryAddress
  toggleDeliveryAddress() if $('div.checkout').length
  
  #
  # Receive some response from the orders controller and update the order items
  # table as appropriate.
  #
  updateOrderItemsFromRemote = (data)->
    if data.status == 'complete'
      if data.redirect?
        window.location.replace(data.redirect)
      else if data.items?
        $('table.orderItems').replaceWith(data.items)
    else if data.status == 'error'
      alert data.message
    
  #
  # Submit a link
  #
  ajaxLink = (successMethod)->
    $.ajax
      url: $(this).attr('href')
      type: $(this).data('method')
      dataType: 'json'
      success: successMethod
    false
    
  #
  # When clicking links in the order items table, submit them
  # using the ajaxLink helper
  #
  $('body').on 'click', 'table.orderItems tbody td a.ajax', -> ajaxLink.call(this, updateOrderItemsFromRemote)
  
  #
  # When the delivery method is changed on the form, submit the associated
  # form with ajax
  #
  $('body').on 'change', 'table.orderItems select', -> 
    form = $(this).parents('form')
    $.ajax
      url: form.attr('action')
      type: form.attr('method')
      data: form.serialize()
      dataType: 'json'
      success: updateOrderItemsFromRemote
      