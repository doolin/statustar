module ApplicationHelper

  # insert logo and path
  def logo
    image_tag('statustar_logo.png', alt: 'StatuStar - Update Anywhere Status Everywhere', class: 'round')
  end

  # Return a title on a per page basis
  def title
    base_title = 'Statustar'
    if @title.nil?
        base_title
    else
        "#{base_title} | #{@title}"
    end
  end

end
