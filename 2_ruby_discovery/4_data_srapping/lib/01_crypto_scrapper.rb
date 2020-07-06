require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  crypto_keys = []
  crypto_values = []

  # Scrap crypto symbols into an array
  page.css('tr.cmc-table-row  > td:nth-child(3) > div').each do |node|
    crypto_keys.push(node.content)
  end

  # Scrap crypto prices into an array
  page.css('tr.cmc-table-row  > td:nth-child(5) > a').each do |node|
    crypto_values.push(node.content)
  end

  # Merge both arrays into a hash
  cryptocurrencies_hash = Hash[crypto_keys.zip(crypto_values)]

  # Display all the cryptocurrencies
  cryptocurrencies_hash.each do |key, value|
    puts key + ' : ' + value
  end
end

crypto_scrapper
