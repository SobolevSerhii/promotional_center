# frozen_string_literal: true

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

class PromoMessage < ApplicationRecord
  # @note Admin who created this promo_message
  belongs_to :creator, optional: true
  has_many :promo_message_recipients, dependent: :destroy
  has_many :recipients, through: :promo_message_recipients, source: :recipient

  # @note - active only used for sending
  enum status: %i[active pending detach]

  validates :body, :title, presence: true
end
