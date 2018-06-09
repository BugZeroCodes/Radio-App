class Announcement < ApplicationRecord
  has_many :readings, dependent: :destroy

  validates :text, :expires_at, presence: true

  scope :expired, -> { where('expires_at < ?', Time.now) }
end
