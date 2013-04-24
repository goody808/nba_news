class Post < ActiveRecord::Base
  
  def self.update_from_feed()
  	feed = Feedzirra::Feed.fetch_and_parse("http://feeds.feedburner.com/PaulDixExplainsNothing")
  	i = 0
  	postNo = 0
  	feed.entries.each do |entry|
  		unless exits? id: entry.id
  			create!(
  			name:					entry.title, 
  			summary: 			entry.summary,
  			url: 					entry.url, 
  			published_at: entry.published, 
  			id: 					entry.id
  			)
  			if postNo != 0
  				i = i + 1
  				if i = postNo 
  					break 
  				end 
  			end 
  		end
  	end
  end 
  attr_accessible :name, :published_at, :summary, :url, :id
end
