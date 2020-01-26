class Release < ApplicationRecord
  belongs_to :user

  validates :artist, :name, presence: true
  validates :format_quantity, :discogs_release_id, :discogs_community_have,
            :discogs_community_want, :discogs_number_for_sale,
            numericality: { only_integer: true }, allow_nil: true
  validates :discogs_lowest_price, numericality: true, allow_nil: true
  validates :discogs_release_id, uniqueness: { scope: :user_id }, allow_nil: true
  validates :catalog_number, uniqueness: { scope: %i[user_id label] }

  after_initialize :initialize_format_quantity

  scope :of_user, ->(user) { where(user: user) }
  scope :ordered, -> { order(created_at: :desc) }

  def decorate
    @decorate ||= ReleaseDecorator.new(self)
  end

  private

  def initialize_format_quantity
    self.format_quantity ||= 1
  end
end
