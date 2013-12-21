window.id = null
socket = io.connect 'http://192.168.11.109:8080'

socket.emit 'test', 'hi'

$('body').mousemove (ev) ->
    socket.emit 'mousemove', {id:window.id, pos: {x: ev.pageX, y: ev.pageY}}

socket.on 'id', (_id) ->
    if window.id?
        $('#mice').remove($('#'+window.id))
    window.id = _id
    console.log "MY ID IS " + window.id
    $('#mice').append("<li id=#{window.id}>#{window.id}: null, null</li>")

socket.on 'mousemove', (mouse) ->
    [_id, x, y] = [mouse.id, mouse.pos.x, mouse.pos.y]
    if _id.length > 0
        if $('#'+_id).length > 0
            $('#'+_id).text("#{_id}: #{x},#{y}")
        else
            $('#mice').append("<li id=#{_id}>#{_id}: #{x}, #{y}</li>")