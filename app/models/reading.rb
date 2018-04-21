class Reading < ApplicationRecord
  belongs_to :user
  belongs_to :announcement

  validates :recited_at, presence: true
end
