module ApplicationHelper
  #returns the title + standard title OOOR only the standard title if a title is not previously defined.
  def full_title(page_title)
    base_title = "Sample App for the Rails Tutorial"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
