require_relative 'guestlist'
require_relative 'controller'
require_relative 'router'

guestlist_file   = File.join(__dir__, 'guest_list.csv')
countriesavailable_file = File.join(__dir__, 'countries_available.csv')
guestlist  = Guestlist.new(guestlist_file, countriesavailable_file)
controller = Controller.new(guestlist)

router = Router.new(controller)

router.run
