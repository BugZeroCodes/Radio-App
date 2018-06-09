class Announcement < ApplicationRecord
  has_many :readings, dependent: :destroy

  validates :text, :expires_at, presence: true
end
