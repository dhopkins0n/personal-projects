# TODO: Define your View class here, to display elements to the user and ask them for their input
require_relative "guestlist"
require_relative "controller"

class View

  def display_list(guests)
    if guests.empty?
      puts "you have no guests yet!"
    end
   guests.each_with_index do |guest, index|

      puts "#{index + 1}.  #{guest.name.capitalize} representing #{guest.country}"
    end
  end

  def display_available_countries(countries)
    countries.each_with_index do |country, index|
    puts "#{index + 1}.  #{country}"
    end
  end



  def ask_for_name
    print "who do you want to add?\n> "
   name = gets.chomp
  end

  def success_message(guest)
    puts "#{guest.name} was successfully added to the party representing #{guest.country}!"
  end

  def ask_for_index(action)
    print "Which guest do you want to #{action}?\n> "
    gets.chomp.to_i - 1
  end


end
