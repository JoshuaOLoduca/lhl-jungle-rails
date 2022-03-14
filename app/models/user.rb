class User < ActiveRecord::Base
  has_secure_password
  
  before_validation :downcase_email
  
  validates :name, presence: true
  validates :email, presence: true, :uniqueness => true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

end
