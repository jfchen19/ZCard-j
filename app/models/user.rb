class User < ApplicationRecord

  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :password, presence: true,
                       confirmation: true
  validates :nickname, presence: true

  before_create :encrypt_password


  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end

end
