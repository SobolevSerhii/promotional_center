# frozen_string_literal: true

# == Schema Information
#
# Table name: promo_message_recipients
#
#  id               :bigint           not null, primary key
#  recipient_phone  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ad_id            :bigint           not null
#  promo_message_id :bigint           not null
#  recipient_id     :bigint           not null
#
# Indexes
#
#  index_promo_message_recipients_on_ad_id             (ad_id)
#  index_promo_message_recipients_on_promo_message_id  (promo_message_id)
#  index_promo_message_recipients_on_recipient_id      (recipient_id)
#  index_promo_message_recipients_on_recipient_phone   (recipient_phone)
#
# Foreign Keys
#
#  fk_rails_...  (ad_id => ads.id)
#  fk_rails_...  (promo_message_id => promo_messages.id)
#  fk_rails_...  (recipient_id => users.id)
#

class PromoMessageRecipient < ApplicationRecord
  # @note
  # This join model for saved promo_message for recipients
  belongs_to :ad
  belongs_to :promo_message
  belongs_to :recipient, class_name: :User, foreign_key: :recipient_id

  before_validation do
    self.recipient = ad&.publisher
    self.recipient_phone = recipient&.phone
  end

  scope :filter_by_time_period, lambda { |date_from, date_to|
    if date_from && date_to
      where(created_at: date_from..date_to)
    elsif date_from
      where('created_at > ?', date_from)
    elsif date_to
      where('created_at < ?', date_to)
    else
      all.order(created_at: :desc)
    end
  }
end
