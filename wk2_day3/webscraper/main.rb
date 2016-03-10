# Webscraper
require 'rubygems'
require 'open-uri'
require 'nokogiri'

require_relative 'comment'
require_relative 'post'
require_relative 'scraper'


url = 'post.html'

@scraper = Scraper.new(url)

def scraped_comments
  @scraper.get_comments
end

def scraped_title
  @scraper.get_title
end

def scraped_points
  @scraper.get_points
end

def scraped_item_id
  @scraper.get_item_id
end

# puts "~~~~~~~~~~~ COMMENTS ~~~~~~~~~~~~~~"
# comments = @scraper.get_comments
# puts comments

# puts "~~~~~~~~~~~~~ TITLE ~~~~~~~~~~~~~~~"
# title = @scraper.get_title
# puts title

# puts "~~~~~~~~~~~~~~~ POINTS ~~~~~~~~~~~~"
# points = @scraper.get_points
# puts points

# puts "~~~~~~~~~~~~~~ ID ~~~~~~~~~~~~~~~~~"
# id = @scraper.get_item_id
# puts id

latest = Post.new(scraped_title, url, scraped_points, scraped_item_id)
latest.add_comment(scraped_comments)

puts "Here is the latest scraped content!!"
puts latest.comments

#require './main.rb'
#@scraper.page.search("span.title")

#@scraper.page.search('.comhead > a')[1].attributes['href'].value
# [1...49]

#@scraper.page.search('.comment')[0].text
