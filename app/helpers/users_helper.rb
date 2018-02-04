module UsersHelper
    def gravatar_for(user)
        # Digest::MD5::hexdigestで引数をハッシュ化(user.email.downcase)
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        image_tag(gravatar_url,alt: user.name, class: "gravatar")
    end
end
