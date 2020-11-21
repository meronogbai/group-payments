module GroupsHelper
  def display_icon(group)
    if group.icon.attached?
      image_tag url_for(group.icon)
    else
      image_tag 'default-group-icon.png'
    end
  end
end
