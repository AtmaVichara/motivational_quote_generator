class QuoteCollectorJob < ApplicationJob
  queue_as :default

  def perform(*args)
    populate_database
  end

  def populate_database
    grab_info.each do |info|
      author = Author.find_or_create_by(name: info[:author].downcase)
      author.quotes.find_or_create_by(content: info[:quote])
    end
  end

  def grab_info
    QuoteGeneratorService.new().get_quotes_and_authors
  end

end
