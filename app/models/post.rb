class Post < ApplicationRecord
  belongs_to :board   # 此model會有board方法
  belongs_to :user    # 此model會有user方法

  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    self.user = user
  end
end
