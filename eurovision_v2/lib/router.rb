class Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome to Eurovision! 🇪🇺 🎉🎉🎉"
    puts "           --           "

    while @running
      display_options
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.remove
    when 4 then @controller.list_available_countries
    when 5 then stop
    else
      puts "Please press 1, 2, 3,  4 or 5"
    end
  end

  def stop
    @running = false
  end

  def display_options
    puts ""
    puts "What do you want to do next?"
    puts "1 - view guestlist"
    puts "2 - Add a new guest"
    puts "3 - Remove a guest"
    puts "4 - See available countries"
    puts "5 - Stop and exit the program"
  end
end
