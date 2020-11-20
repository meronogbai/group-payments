module ApplicationHelper
  def burger_path
    return current_user if logged_in?

    root_path
  end
end
