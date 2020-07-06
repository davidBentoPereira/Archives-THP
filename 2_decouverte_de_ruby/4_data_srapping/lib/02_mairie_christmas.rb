require 'rubygems'
require 'nokogiri'
require 'open-uri'

def array_get_townhall_email(uri_array)
  emails = []
  uri_array.each do |uri|
    page = Nokogiri::HTML(URI.open(uri))
    page.css('table.table:nth-child(1) > tbody:nth-child(3) > tr:nth-child(4) > td:nth-child(2)').each do |node|
      emails.push(node.content)
    end
  end

  emails
end

def array_get_townhall_urls
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  urls = []

  page.css('a.lientxt').each do |node|
    urls.push('http://annuaire-des-mairies.com/' + node['href'])
  end

  urls
end

def array_get_townhall_name
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
  name = []

  page.css('a.lientxt').each do |node|
    name.push(node.content)
  end

  name
end

def perform
  # Get an array of tawnhalls' names
  tawnhall_name_array = array_get_townhall_name

  # Get an array containing all tawnhalls' URLS
  array_of_urls = array_get_townhall_urls

  # Get an array of tawnhall's emails
  tawnhall_email_array = array_get_townhall_email(array_of_urls)

  # Merge both arrays into a hash
  tawnahll_emails_hash = Hash[tawnhall_name_array.zip(tawnhall_email_array)]

  # Display all the cryptocurrencies
  tawnahll_emails_hash.each do |key, value|
    puts key + ' : ' + value
  end
end

# Run the program
perform
