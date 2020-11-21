module UsersHelper
  def display_avatar(user)
    if user.avatar.attached?
      image_tag url_for(user.avatar), class: 'rounded-circle'
    else
      image_tag 'default-avatar.png', class: 'rounded-circle'
    end
  end
end
