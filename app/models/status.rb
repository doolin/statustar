# frozen_string_literal: true

class Status < ActiveRecord::Base
  # attr_accessible :state

  belongs_to :user

  validates :state, presence: true, length: { maximum: 1 }, inclusion: { in: 1..3 }
  validates :user_id, presence: true

  default_scope { order('statuses.created_at DESC') }

  def content
    state
  end

  def find_active(_state)
    return 'active' if _state == state
    'inactive'
  end

  # Return statuses from the users being followed by the given user.
  scope :from_users_followed_by, ->(user) { followed_by(user) }

  # Return an SQL condition for users followed by the given user.
  # We include the user's own id as well.
  def self.followed_by(user)
    followed_ids = %(SELECT followed_id FROM relationships
                     WHERE follower_id = :user_id)
    where("user_id IN (#{followed_ids}) OR user_id = :user_id",
          user_id: user)
  end
end
