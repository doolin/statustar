# frozen_string_literal: true

class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # before_save :ensure_authentication_token

  # validates :username, presence: true
  validates :email, :password, presence: true
  validates :username, :email, uniqueness: true
  validates :username, length: { maximum: 50 }
  validates :password, length: { within: 6..40 }

  has_many :statuses,      dependent: :destroy

  has_many :relationships, foreign_key: 'follower_id',
                           dependent: :destroy
  has_many :following,     through: :relationships,
                           source: :followed
  has_many :reverse_relationships, foreign_key: 'followed_id',
                                   class_name: 'Relationship',
                                   dependent: :destroy
  has_many :followers, through: :reverse_relationships,
                       source: :follower

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :name,  presence: true, length: { maximum: 50 }
  validates :email, format: { with: email_regex } # , uniqueness: { case_sensitive: false }
  # Automatically create the virtual attribute 'password_confirmation'.
  # validates :password,  presence: true, confirmation: true, length: { within: 6..40 }

  # before_save :encrypt_password

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(followed_id: followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end

  def feed
    Status.from_users_followed_by(self)
  end
end
