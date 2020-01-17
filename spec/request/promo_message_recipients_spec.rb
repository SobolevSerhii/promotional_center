# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PromoMessageRecipientsController', type: :request do
  let(:ad) { create(:ad) }
  let!(:promo_message) { create :promo_message }
  let!(:promo_message_recipient) do
    create :promo_message_recipient, recipient: ad.publisher, ad: ad
  end

  context 'GET /promo_message_recipients' do
    it 'GET list of promo_messages' do
      get('/promo_message_recipients')
      expect(response.status).to eq 200
    end
  end
end
