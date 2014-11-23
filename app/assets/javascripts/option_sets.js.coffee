$ ->
  $('body').on 'submit', '.option_set_form', ->
    $('.submit i').addClass('fa-spin')

  $('[data-action=selectContents]').click (e) ->
    @select()

  set_listchars_disabled = (disabled) ->
    $('.listchar').prop('disabled', disabled)

  if $('[data-action=disable_listchars][checked=checked]').length > 0
    set_listchars_disabled(true)

  $('[data-action=disable_listchars]').click (e) ->
    set_listchars_disabled(true)

  $('[data-action=enable_listchars]').click ->
    set_listchars_disabled(false)
