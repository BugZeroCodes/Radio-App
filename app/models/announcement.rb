class Announcement < ApplicationRecord
  has_many :readings

  validates :text, :expires_at, presence: true
end
