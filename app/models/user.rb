class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      puts "DEBUG " + "=" * 50
      # p auth
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
