module GroupsHelper
  def display_icon(group)
    if group.icon.attached?
      image_tag group.display_image, class: 'group-img'
    else
      image_tag 'default-group-icon.png', class: 'group-img'
    end
  end
end
