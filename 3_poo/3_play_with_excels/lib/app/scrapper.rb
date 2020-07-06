class Scrapper
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

  def export_in_json(townhall_hash)
    File.open("db/emails.json","w") do |f|
      f.write(townhall_hash.to_json)
    end

    puts "All scrapped townhall data has been exported to json format in emails.json"
  end

  def export_on_google_spreadsheet(townhall_hash)
    # Creates a session
    session = GoogleDrive::Session.from_service_account_key("./config.json")

    # First worksheet
    ws = session.spreadsheet_by_name("THP Townhall Scrapping").worksheets.first

    # Create labels
    ws[1, 1] = "Name"
    ws[1, 2] = "Email"

    # Create name and email data
    row = 2
    townhall_hash.each do |name, email|
      ws[row, 1] = name
      ws[row, 2] = email
      row += 1
    end

    # Save changes
    ws.save
    ws.reload
    puts "All scrapped townhall data has been exported to Google Spreadsheet"
  end

  def save_as_csv(townhall_hash)
    # Parse hash into csv format
    csv_file = townhall_hash.map { |c| c.join(",") }.join("\n")

    # Write into emails.csv file
    File.write("db/emails.csv", csv_file)

    puts "All scrapped townhall data has been exported into emails.csv"
  end
end