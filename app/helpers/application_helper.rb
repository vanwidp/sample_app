module ApplicationHelper

	# The logo for the header
	def logo
		logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
	end
	
	# Return a title depending on the page
	def title
		base_title = "Ruby on Rails Tutorial"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end

end
