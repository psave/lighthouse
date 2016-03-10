# Webscraper


# page.css('div#content div#bodyContent table.infobox tr th').each do |el|
#    puts el.text
# end


class Post
  attr_accessor :title, :url, :points, :item_id, :comments
  def initialize(title, url, points, item_id) #add comments?
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def comments
    @comments
  end

  def add_comment(comment)
    @comments << comment
  end

end

