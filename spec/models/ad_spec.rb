# == Schema Information
#
# Table name: ads
#
#  id           :bigint           not null, primary key
#  description  :text             default(""), not null
#  status       :integer          default(0), not null
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

require 'rails_helper'

RSpec.describe Ad, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
