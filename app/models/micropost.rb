# frozen_string_literal: true

class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :unfavorites
  has_many :users, through: :favorites
  has_many :users, through: :unfavorites
  default_scope -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :content, presence: true,
                      length: { maximum: 140 }
  validate  :image_size

  private

  # アップロードされた画像のサイズをバリデーションする
  def image_size
    errors.add(:image, '１MBより小さいサイズにしてください') if image.size > 1.megabytes
  end
end
