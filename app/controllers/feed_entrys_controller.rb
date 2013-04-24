class FeedEntrysController < ApplicationController
  def index
  @feed_urls = ["http://feeds.cbssports.com/cbssportsline/nba_news", 
  	"http://www.nba.com/rss/nba_rss.xml", 
  	"http://sports.yahoo.com/nba/rss.xml", 
  	"http://rss.cnn.com/rss/si_nba.rss", 
  	"http://sports.espn.go.com/espn/rss/nba/news"]
  @post_no
  FeedEntry.update_from_feed(@feed_urls, @post_no)

  end
end
