require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def get_deputy_email(uri)
  page = Nokogiri::HTML(URI.open(uri))
  page.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').each do |node|
    return node.content
  end
end

def array_get_deputy_urls
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  urls = []

  page.css('div.col-container > ul > li > a').each do |node|
    urls.push('http://www2.assemblee-nationale.fr' + node['href'])
  end

  urls
end

def array_get_deputy_name
  page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
  name = []

  page.css('div.col-container > ul > li > a').each do |node|
    name.push(node.content)
  end

  name
end

def give_first_name(full_name)
  full_name.split(' ')[1]
end

def give_last_name(full_name)
  full_name.split(' ')[2]
end

def give_last_name_first_letter(full_name)
  give_last_name(full_name)[0].downcase
end

def perform
  begin
    # Init hash containing all deputys' data
    deputy_data_array = {}

    # Get an array of deputys' names
    deputy_name_array = array_get_deputy_name

    # Get an array of URLs in order to get deputys' emails
    array_of_urls = array_get_deputy_urls

    # Get a deputy email
    i = 0
    array_of_urls.each do |uri|
      letter = give_last_name_first_letter(deputy_name_array[i])

      puts deputy_data_array[letter] = {
        'first_name' => give_first_name(deputy_name_array[i]),
        'last_name' => give_last_name(deputy_name_array[i]),
        'email' => get_deputy_email(uri)
      }
      i += 1
    end
  rescue RuntimeError
    return 'null'
  end
end

# Run the program
perform
