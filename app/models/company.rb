class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects

  private

    def self.auth auth, emailed_required
      credentials = {uid: auth[:uid], provider: auth[:provider] }
      pwd = Devise.friendly_token[0,20]

      Company.find_or_create_by(credentials) do |cmpy|
        cmpy.name = auth[:info][:name]
        cmpy.email = auth[:info][:email] if emailed_required
        cmpy.password = pwd
        cmpy.password_confirmation = pwd
      end
    end


end
