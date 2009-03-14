class Article < ActiveRecord::Base
  
  # search and paginate articles 
  def self.search(search, page)
    paginate :per_page => 5, :page => page,
     	     :conditions => ['description like ?', "%#{search}%"],
	     :order => 'id desc'
  end

  def self.parse_video(string)
    reg = Regex.new("[youtube](.+)[/youtube]$")
  end

end
