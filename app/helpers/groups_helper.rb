module GroupsHelper
  def display_icon(group)
    if group.icon.attached?
      image_tag url_for(group.icon), class: 'group-img'
    else
      image_tag 'default-group-icon.png', class: 'group-img'
    end
  end
end
