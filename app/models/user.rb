class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  #selfは現在のユーザーを指す
  before_save { self.email = self.email.downcase}
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  #allow_nil: trueはパスワードが空のままでもupdateできるようにする
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def feed
    # ↓microposts と同じ
    Micropost.where("user_id = ?", id)
  end
  
end
