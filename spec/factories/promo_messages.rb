# == Schema Information
#
# Table name: promo_messages
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  status     :integer          default("active"), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  creator_id :bigint
#
# Indexes
#
#  index_promo_messages_on_creator_id  (creator_id)
#  index_promo_messages_on_status      (status)
#  index_promo_messages_on_title       (title)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#

FactoryBot.define do
  factory :promo_message do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }
  end
end
