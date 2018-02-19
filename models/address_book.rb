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
        @entries.delete(entry)
        break # there is no need to loop further
      end
    end

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

  # Checkpoint 7  Search AddressBook for a specific entry by name
  def binary_search(name)
    lower = 0
    upper = entries.length - 1

    while lower <= upper
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end

    return nil
  end

  # Assignment 7   iterative search for specific entry by name

  def iterative_search(name)
    @entries.each do |entry|
      if entry.name == name
        return entry
      end
    end

    return nil
  end

  # My first attempt -- works, but less elegant than above bloc solution
  # def iterative_search(name)
  #   n = 0
  #   while n < entries.length do
  #     if name == entries[n].name
  #       return entries[n]
  #     end
  #     n += 1
  #   end
  #
  #   return nil
  # end


end
