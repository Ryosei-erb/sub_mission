module UsersHelper
  def gravatar_for(user)
    gravatar_url = "https://secure.gravatar.com/avatar/#{user}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
