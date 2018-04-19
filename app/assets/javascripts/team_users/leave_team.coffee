$(document).on 'turbolinks:load', ->
  $('body').on 'click', 'a.leave_team', (e) ->
    $('#leave_team_modal').modal('open')
    $('.remove_user_form').attr('action', 'team_users/' + $('.user_id').val())
    $('#leave_team_id').val(e.target.id)
    return false

  $('.remove_user_form').on 'submit', (e) ->
    $.ajax e.target.action,
        type: 'DELETE'
        dataType: 'json',
        data: {team_id: $('#leave_team_id').val()}
        success: (data, text, jqXHR) ->
          $('.team_' + $('#leave_team_id').val()).remove()
          Materialize.toast('Success in remove User &nbsp;<b>:)</b>', 4000, 'green')
        error: (jqXHR, textStatus, errorThrown) ->
          Materialize.toast('Problem to remove User &nbsp;<b>:(</b>', 4000, 'red')

    $('#leave_team_modal').modal('close')
    return false
