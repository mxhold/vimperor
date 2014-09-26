$ ->
  $('body').on 'submit', '.option_set_form', ->
    $('.submit i').addClass('fa-spin')

  $('[data-action=select_contents]').click (e) ->
    @select()
