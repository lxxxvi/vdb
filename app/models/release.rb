class Release < ApplicationRecord
  validates :artist, :name, presence: true
  validates :format_quantity, :discogs_id, :discogs_community_have,
            :discogs_community_want, :discogs_number_for_sale,
            numericality: { only_integer: true }, allow_nil: true
  validates :discogs_lowest_price, numericality: true, allow_nil: true

  scope :ordered, -> { order(created_at: :desc) }
end
