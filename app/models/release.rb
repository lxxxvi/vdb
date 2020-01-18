class Release < ApplicationRecord
  validates :artist, :name, presence: true
  validates :format_quantity, :discogs_id, :discogs_community_have,
            :discogs_community_want, :discogs_number_for_sale,
            numericality: { only_integer: true }, allow_nil: true
  validates :discogs_lowest_price, numericality: true, allow_nil: true

  after_initialize :initialize_format_quantity

  scope :ordered, -> { order(created_at: :desc) }

  def decorate
    @decorate ||= ReleaseDecorator.new(self)
  end

  private

  def initialize_format_quantity
    self.format_quantity ||= 1
  end
end
