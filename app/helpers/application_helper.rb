module ApplicationHelper
  def active_menu? ( link)
    if current_page?(link)
      'active ' 
    else
      ''
    end
  end
end
