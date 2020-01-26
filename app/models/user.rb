class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :rememberable, and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :releases, dependent: :destroy

  enum discogs_token_status: { not_available: 'n/a', invalid: 'invalid', valid: 'valid' }, _prefix: :discogs_token

  after_initialize :initialize_discogs_token_status

  def update_and_check_discogs_token(discogs_token)
    transaction do
      update(discogs_token: discogs_token)
      check_discogs_token
    end
  end

  def check_discogs_token
    update(discogs_token_status: DiscogsApi.identity_status(self),
           discogs_token_status_checked_at: Time.zone.now)
  end

  def decorate
    @decorate ||= UserDecorator.new(self)
  end

  private

  def initialize_discogs_token_status
    self.discogs_token_status ||= User.discogs_token_statuses[:not_available]
  end
end
