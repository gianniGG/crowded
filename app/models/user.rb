class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_and_belongs_to_many :projects

  def self.twitter_auth auth
    auth_user auth
  end

  def self.facebook_auth auth
    auth_user auth, true
  end

  def self.linkedin_auth auth
    auth_user auth, true
  end

  def email_required?
    return false if provider == 'twitter'
    super
  end

  private
    def self.auth_user auth, email_required=false
      credentials = {uid: auth[:uid], provider: auth[:provider] }
      pwd = Devise.friendly_token[0,20]

      User.find_or_create_by(credentials) do |user|
        user.name = auth[:info][:name]
        user.email = auth[:info][:email] if email_required
        user.password = pwd
        user.password_confirmation = pwd
      end
    end


end
