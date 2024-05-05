# TODO: Implement the Cookbook class that will be our repository
require "csv"

class Guestlist
attr_reader :guests, :available_countries

def initialize(guestlist_file_path, countriesavailable_filepath)
    @guests = []
    @guestlist_file_path = guestlist_file_path
    @available_countries = []
    @countriesavailable_filepath = countriesavailable_filepath
    load_csv
end

  def all
    @guests
  end

  def all_countries
    @available_countries
  end

  def remove_country(country)
    @available_countries =  @available_countries.reject{|x| x == country}
    save_csv
  end

  def create(guest)
    @guests << guest
    save_csv
  end

  def destroy(index)
    guest = @guests.select.with_index{|x,i| i==index}[0]
    @available_countries << guest.country
    @available_countries = @available_countries.sort!
    @guests.delete_at(index)
    save_csv
  end
  def load_csv
    CSV.foreach(@guestlist_file_path) do |row|
      guest = Guest.new(row[0], row[1])
      @guests << guest
    end
    CSV.foreach(@countriesavailable_filepath) do |country|
      #country = Country.new(country[0])
    @available_countries << country[0]
    end
  end

  private
  def save_csv
    CSV.open(@guestlist_file_path, "wb") do |csv|
      @guests.each do |guest|
        csv << ([guest.name, guest.country])
      end
    end
    CSV.open(@countriesavailable_filepath, "wb") do |csv|
      @available_countries.each do |country|
        csv << ([country])
      end
    end
  end
end
