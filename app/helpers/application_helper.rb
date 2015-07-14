module ApplicationHelper
  def active_menu? ( link)

    if request.url.include?(link)
      'active ' 
    else
      ''
    end
  end
end
