# Webscrapper



class Scraper

  attr_reader :page

  def initialize(url_to_scrape)
    @page = Nokogiri::HTML(open(url_to_scrape))
  end

  def get_comments
    all_comments_array = []
    @page.search('.comment').each do |extract_comment|
      all_comments_array << Comment.new(extract_comment.text)
      #all_comments_array.push(all_comments)
    end
    all_comments_array
  end

  # def get_comment_and_author

  # end

  def author
    all_authors_array = []
    @page.search('.comhead > a')[1].attributes['href'].value
  end

  def get_title
    title = page.search(".title")[1].children.children.text
    #"Show HN: Velocity.js \u00E2\u0080\u0093 Accelerated JavaScript animation (velocityjs.org)
    #@page.search("td.title > a")[0].attributes['href'].value
    title
  end

  def get_points
    scraped_points = @page.search(".score").inner_text
    points = /\d+/.match(scraped_points).to_s.to_i
    points
  end

  def get_item_id
    scraped_id = page.search('td.votelinks > center > a')[0].attributes["id"].value
    id = /\d+/.match(scraped_id).to_s.to_i
    id
  end

end
