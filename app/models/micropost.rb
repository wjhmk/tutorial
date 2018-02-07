class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } #投稿を降順で表示
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  #独自のバリデーションを定義するために、今まで使っていたvalidatesメソッドではなく、validateメソッドを使っている
  validate  :picture_size
  
  private
    def picture_size
        if picture.size > 5.megabytes
          # errorsコレクションに追加
          errors.add(:picture, "should be less than 5MB")
        end
    end
end
