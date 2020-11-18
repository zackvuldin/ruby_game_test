require 'ruby2d'
# procedural programming, no OOP yet
set background: 'red'
set title: 'Reaction Game'

message = Text.new('Click to Start', x: 20, y:20)
game_started = false
square = nil
start_time = nil
duration = nil


on :mouse_down do |event|
    # x and y coordinates of the mouse button event
    # prints out coords of mouse click
    puts event.x, event.y

    if game_started
        if square.contains?(event.x, event.y)
        duration = ((Time.now - start_time) * 1000).round
        message = Text.new("#{duration} points! (miliseconds lol) Click to restart")
        square.remove
        game_started = false
    end
    else
        message.remove

    square = Square.new(
        x: rand(get(:width) - 25), y: rand(get(:height) - 25),
        size: 25,
        color: 'blue'
    )
    start_time = Time.now
    game_started = true
    end
end

show