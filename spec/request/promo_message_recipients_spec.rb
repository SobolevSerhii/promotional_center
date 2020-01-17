# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PromoMessageRecipientsController', type: :request do
  let(:ad_publisher) { create(:user) }
  let(:ad) { create(:add, publisher: ad_publisher) }
  let!(:promo_message) { create :promo_message }
  let!(:promo_message_recipient) { create :promo_message_recipient, recipient: ad.publisher, ad: ad }

  context 'GET /promo_messages' do
    it 'GET list of promo_messages' do
      get(promo_message_recipients_path)
      expect(promo_messages.count).to eq PromoMessage.count
      expect(response.status).to eq 200
      promo_messages = JSON.parse response.body
      expect(promo_messages).to eq PromoMessage.all.as_json
    end
  end

