# frozen_string_literal: true

# == Schema Information
#
# Table name: ads
#
#  id           :bigint           not null, primary key
#  description  :text             default(""), not null
#  status       :integer          default("published"), not null
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  publisher_id :bigint
#
# Indexes
#
#  index_ads_on_publisher_id  (publisher_id)
#  index_ads_on_status        (status)
#  index_ads_on_title         (title)
#
# Foreign Keys
#
#  fk_rails_...  (publisher_id => users.id)
#

class Ad < ApplicationRecord
  belongs_to :publisher, class_name: :User

  enum status: %i[published detach]

  scope :ipublished_in_time_interval, lambda { |date_from, date_to|
    if date_from && date_to
      where(created_at: date_from..date_to)
    elsif date_from
      where('created_at > ?', date_from)
    elsif date_to
      where('created_at < ?', date_to)
    end
  }
end
