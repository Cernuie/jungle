class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 4}

  before_save { |user| user.email = user.email.downcase}

  def self.authenticate_with_credentials(email, password)
    email = email.strip.downcase
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      return @user
    else
      nil
    end
  end
end
