class User < ApplicationRecord
  def user_name
    github_name if name == ''
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider    = auth["provider"]
      user.uid         = auth["uid"]
      user.github_name = auth["info"]["nickname"]
    end
  end
end
