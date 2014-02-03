class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.twitter_auth auth
    credentials = {uid: auth[:uid], provider: auth[:provider] }
    pwd = Devise.friendly_token[0,20]

    User.find_or_create_by(credentials) do |user|
      user.name = auth[:info][:name]
      user.password = pwd
      user.password_confirmation = pwd

    end
  end

  def self.facebook_auth auth
    credentials = {uid: auth[:uid], provider: auth[:provider] }

  end

  def self.linkedin_auth auth
    credentials = {uid: auth[:uid], provider: auth[:provider] }
  end

  def email_required?
    return false if provider == 'twitter'
    super
  end


end
