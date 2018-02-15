require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
    @entries = []
  end

  def add_entry(name, phone_number, email)
    # #9
    index = 0
    @entries.each do |entry|
    # #10
      if name < entry.name
        break
      end
      index+= 1
    end
    # #11
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

  # Assignment 4
  def remove_entry(name, phone_number, email)

    entry_to_remove = nil

    @entries.each do |entry|
      if entry.name == name && entry.phone_number == phone_number && entry.email == email
        entry_to_remove = entry
      end
    end

    @entries.delete(entry_to_remove)
  end

  # Checkpoint 6
  def import_from_csv(file_name)
    # read file, use CSV class to parse-- results in object of type CSV::Table
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    # iterate over teh CSV::Table object's rows
    # convert each row_hash to and Entry using add_entry method
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end
end
