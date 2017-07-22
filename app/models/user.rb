class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: /@/

  before_save :downcase_email

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

end
