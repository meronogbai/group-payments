module UsersHelper
  def display_avatar(user)
    if user.avatar.attached?
      image_tag user.display_image, class: 'avatar rounded-circle'
    else
      image_tag 'default-avatar.png', class: 'avatar rounded-circle'
    end
  end
end
