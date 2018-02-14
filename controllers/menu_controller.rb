require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - View Entry Number n"
    puts "6 - Exit"

    print "Enter your selection: "

    selection = gets.to_i
    # puts "You picked #{selection}"

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        read_csv
        main_menu
      # Assignment 5
      when 5
        system "clear"
        enter_entry_number
        main_menu
      when 6
        puts "Good-bye!"
        # terminate program-- exit without error
        exit(0)
      # for case where invalid user input
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
      end
    end

    def view_all_entries
      address_book.entries.each do |entry|
        system "clear"
        puts entry.to_s
        # display a submenu for each entry
        entry_submenu(entry)
      end

      system "clear"
      puts "End of entries"
    end

    def create_entry
      system "clear"
      puts "New AddressBloc Entry"
      print "Name: "
      name = gets.chomp
      print "Phone Number: "
      phone = gets.chomp
      print "Email: "
      email = gets.chomp

      address_book.add_entry(name, phone, email)

      system "clear"
      puts "New Entry created"
    end

    def search_entries
    end

    def read_csv
    end

    def entry_submenu(entry)
         # display submenu options
         puts "n - next entry"
         puts "d - delete entry"
         puts "e - edit this entry"
         puts "m - return to main menu"

         selection = gets.chomp

         case selection
           when "n"   # next entry -- do nothing
           when "d"   # delete entry
           when "e"   # edit entry
           when "m"   # return main menu
             system "clear"
             main_menu
           else
             system "clear"
             puts "#{selection} is not a valid input"
             entry_submenu(entry)
         end
       end

      #Assignment 5
      def enter_entry_number
        puts "Enter the entry number: "
        selection = gets.chomp.to_i
        puts "you have selected entry no. #{selection}"

        if selection-1 < @address_book.entries.count
          #must be valid index number in address_book array
          # note: -1 from user's input to account for 0-based index); entry "1" = index "0"
          puts@address_book.entries[selection-1]
          puts "Press enter to return to main menu"
          gets.chomp
          system "clear"
        else
          puts "#{selection} is not a valid input"
          enter_entry_number   #run it again
        end
      end

end
