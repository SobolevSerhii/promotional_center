# == Schema Information
#
# Table name: promo_message_recipients
#
#  id               :bigint           not null, primary key
#  recipient_phone  :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ads_id           :bigint           not null
#  promo_message_id :bigint           not null
#  recipient_id     :bigint           not null
#
# Indexes
#
#  index_promo_message_recipients_on_ads_id            (ads_id)
#  index_promo_message_recipients_on_promo_message_id  (promo_message_id)
#  index_promo_message_recipients_on_recipient_id      (recipient_id)
#  index_promo_message_recipients_on_recipient_phone   (recipient_phone)
#
# Foreign Keys
#
#  fk_rails_...  (ads_id => ads.id)
#  fk_rails_...  (promo_message_id => promo_messages.id)
#  fk_rails_...  (recipient_id => users.id)
#

class PromoMessageRecipient < ApplicationRecord
  belongs_to :promo_message
  belongs_to :recipient
  belongs_to :ads
end
