class User < ActiveRecord::Base
  has_secure_password
  
  before_validation :downcase_email
  
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => true
  validates :password, length: {minimum: 3}, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials email, password
    # debug email.methods
    email.strip!
    email.downcase!
    user = self.find_by_email email

    return user if user && user.authenticate(password)
    return nil
  end

  private

  def downcase_email
    self.email = email.strip.downcase if email.present?
  end

end
