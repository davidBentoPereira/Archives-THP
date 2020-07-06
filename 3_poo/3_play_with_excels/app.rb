require 'bundler'
Bundler.require

require_relative './lib/app/scrapper'

require 'rubygems'
require 'open-uri'

# Create instance of MairyChristmasScrapping
townhall = Scrapper.new

# Display a begin message
puts "Program is running, please wait a few seconds..."

# Get an array of tawnhalls' names
tawnhall_name_array = townhall.array_get_townhall_name

# Get an array containing all tawnhalls' URLS
array_of_urls = townhall.array_get_townhall_urls

# Get an array of tawnhall's emails
tawnhall_email_array = townhall.array_get_townhall_email(array_of_urls)

# Merge both arrays into a hash
townhall_hash = Hash[tawnhall_name_array.zip(tawnhall_email_array)]

# Export data to json
townhall.export_in_json(townhall_hash)

# Export data to Google Spreadsheet
townhall.export_on_google_spreadsheet(townhall_hash)

# Export data to Google Spreadsheet
townhall.save_as_csv(townhall_hash)

# Display all the cryptocurrencies
townhall_hash.each do |key, value|
  puts key + ' : ' + value
end