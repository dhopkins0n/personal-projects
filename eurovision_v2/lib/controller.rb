
require_relative "guestlist"
require_relative "guest"
require_relative "view"
require_relative "country"
class Controller
  def initialize(guestlist)
    @guestlist = guestlist
    @view = View.new
  end

  def list
   display_guestlist
  end

  def list_available_countries
      countries = @guestlist.all_countries
      @view.display_available_countries(countries)
  end


  def add

    countries = @guestlist.all_countries
    name = @view.ask_for_name
    country = countries.sample
    guest = Guest.new(name, country)
    @guestlist.create(guest)
@guestlist.remove_country(country)
    @view.success_message(guest)
  end

  def remove
   display_guestlist
    index = @view.ask_for_index('delete')
    @guestlist.destroy(index)
  end

  def display_guestlist
   guests = @guestlist.all
    countries = @guestlist.all_countries
    @view.display_list(guests,)
  end
end
