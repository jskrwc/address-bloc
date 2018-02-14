require_relative 'controllers/menu_controller'


menu = MenuController.new   #  create a new MenuController when AddressBloc starts

system "clear"    #clear command line
puts "Welcome to AddressBloc!"

menu.main_menu     #call main_menu to display menu
