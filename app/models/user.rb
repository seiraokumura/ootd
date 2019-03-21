# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :microposts, dependent: :destroy
  has_many :favorites
  has_many :unfavorites
  has_many :fav_microposts, through: :favorites, source: :micropost
  has_many :unfav_microposts, through: :unfavorites, source: :micropost

  def self.find_for_oauth(auth)
    user = User.find_by(uid: auth.uid, provider: auth.provider)

    user ||= User.create(
      uid: auth.uid,
      provider: auth.provider,
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20]
    )

    user
  end

  # Goodする
  def good(micropost)
    favorites.find_or_create_by(micropost_id: micropost.id)
  end

  # Goodを外す
  def ungood(micropost)
    favorite = favorites.find_by(micropost_id: micropost.id)
    favorite.destroy if favorite
  end

  # Badする
  def bad(micropost)
    unfavorites.find_or_create_by(micropost_id: micropost.id)
  end
  
  # Badを外す
  def notbad(micropost)
    unfavorite = unfavorites.find_by(micropost_id: micropost.id)
    unfavorite.destroy if favorite
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
