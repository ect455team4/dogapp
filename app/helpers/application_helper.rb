module ApplicationHelper

# Return a title om a per-page basis.
def title
	base_title = "DOG WALKERS" #TITLE goes here
	if @title.nil?
		base_title
	else
		"#{base_title} | #{@title}"
	end
  end
end

