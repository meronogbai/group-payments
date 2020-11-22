module UsersHelper
  def display_avatar(user)
    if user.avatar.attached?
      image_tag url_for(user.avatar), class: 'avatar rounded-circle'
    else
      image_tag 'default-avatar.png', class: 'avatar rounded-circle'
    end
  end
end
