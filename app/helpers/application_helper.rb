module ApplicationHelper
  def burger_path
    return current_user if logged_in?

    root_path
  end

  def creation_date(obj)
    obj.created_at.strftime('%d %b %Y')
  end
end
