
functionName = ->
  $('#new_status').on('click', -> alert("Ajax SUCCESS!!!"))


$(document).ready ->
    $("#new_status")
      .bind "ajax:success", (event, data) ->
        alert("Ajax SUCCESS!!!")
