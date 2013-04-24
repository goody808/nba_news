class FeedEntry < ActiveRecord::Base
  attr_accessible :guid, :name, :published_at, :summary, :url
  

  def self.update_from_feed(feeds, postNo)
  	feeds.each do |feed_url|
	  	feed = Feedzirra::Feed.fetch_and_parse(feed_url)
	  	i = 0
	  	add_entries(feed.entries)
	  	
	  	if postNo != 0
		  	i = i + 1
				if i == postNo 
					break 
				end 
			end 
  	end
  end
  
  def self.add_entries(entries)
  	entries.each do |entry|
  		unless exists? guid: entry.id
				create!(
				name:						entry.title, 
				summary: 				entry.summary,	
				url: 						entry.url, 
				published_at: 	entry.published, 
				guid: 					entry.id
				)
			end
  	end
  end 
end
