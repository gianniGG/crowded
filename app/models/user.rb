class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :donations
  has_many :projects, through: :donations

  def email_required?
    return false if provider == 'twitter'
    super
  end

  def ghost?
    company.exists?
  end

  private
    def self.auth auth, email_required
      credentials = {uid: auth[:uid], provider: auth[:provider] }
      pwd = Devise.friendly_token[0,20]

      User.find_or_create_by(credentials) do |user|
        user.name = auth[:info][:name]
        user.email = auth[:info][:email] if email_required
        user.password = pwd
        user.password_confirmation = pwd
        user.profile_picture = auth[:info][:image]
      end
    end


end
