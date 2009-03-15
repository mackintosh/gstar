class Article < ActiveRecord::Base
  
 
  # search and paginate articles 
  def self.search(search, page)
    paginate :per_page => 5, :page => page,
     	     :conditions => ['description like ?', "%#{search}%"],
	     :order => 'id desc'
  end

  ####
  # parse_video() accepts a string of the form [youtube]param[/youtube] 
  # and replaces it with a youtube embedded video.
  def self.parse_video(string)
    
    youtube = 
	"<table class=\"tborder\" cellpadding=\"6\" cellspacing=\"1\" border=\"0\" width=\"400\" style=\"margin:10px 0\">
	 <thead>
	   <tr>
	     <td class=\"tcat\" colspan=\"2\" style=\"text-align:center\">
	       <span style=\"float:right;margin-left:5px;cursor:pointer;font-weight:bolder;\" title=\"Increase this video's size\" onclick=\"
	         if ( this.innerHTML == '+' ) {
		   this.innerHTML = '-';
		   this.title = 'Reset video size';
		   this.parentNode.parentNode.parentNode.parentNode.width=638;
		   this.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('object')[0].width=638;
		   this.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('object')[0].height=515;
		 } else {
		   this.innerHTML = '+';
		   this.title = 'Increase this video\'s size';
		   this.parentNode.parentNode.parentNode.parentNode.width=425;
		   this.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('object')[0].width=425;
		   this.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('object')[0].height=355;
		 }
		\">+</span>
	 	  <a href=\"http://www.youtube.com/watch?v={param}\" title=\"View this video at YouTube in a new window or tab\" target=\"_blank\">YouTube Video</a>
		</td>
	  </tr>
	</thead>
	<tbody>
	<tr>
	  <td class=\"panelsurround\" align=\"center\">
	    <object width=\"425\" height=\"355\" type=\"application/x-shockwave-flash\" data=\"http://www.youtube.com/v/{param}\">
	      <param name=\"movie\" value=\"http://www.youtube.com/v/{param}\" />
	      <param name=\"wmode\" value=\"transparent\" />
	      <em><strong>ERROR:</strong> If you can see this, then <a href=\"http://www.youtube.com/\">YouTube</a> is down or you don't have Flash installed.</em>
	    </object>
	  </td>
	</tr>
	</tbody>
	</table>"
    
    # [youtube]http://www.youtube.com/watch?v=6icJT3BQ4pI&eurl=http://oceansidegenerals.com/[/youtube]
    reg = /\[youtube\]http:\/\/www.youtube.com\/watch\?v=(.+)\[\/youtube\]/
 
    if reg.match(string)
      youtube.gsub(/\{param\}/, reg.match(string)[1])
    else
      return string
    end

  end

end
