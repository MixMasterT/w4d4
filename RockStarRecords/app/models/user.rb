# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string           not null
#  session_token :string           not null
#  pw_digest     :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base
  validates :email, :pw_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom.urlsafe_base64(128)
  end

  def self.find_by_cred(email, pass)
    user = User.find_by(email: email)
    return nil unless user
    if user.is_password?(pass)
      user
    else
      nil
    end
  end

  def password=(pass)
    @password = pass
    self.pw_digest = BCrypt::Password.create(pass)
  end

  def is_password?(word)
    BCrypt::Password.new(self.pw_digest).is_password?(word)
  end

  private

  def ensure_token
    tok = random_token
    self.session_token = tok
  end

  def random_token
    SecureRandom.urlsafe_base64(128)
  end
end
