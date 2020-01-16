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

require 'rails_helper'

RSpec.describe PromoMessageRecipient, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
