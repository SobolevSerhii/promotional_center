# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PromoMessagesController', type: :request do
  let(:promo_message_attrs) do
    {
      body: 'Test Example Body For PromoMessage',
      title: 'Test Example Title For PromoMessage'
    }
  end

  let(:promo_message_update_attrs) do
    {
      body: 'Updated Test Example Body For PromoMessage',
      title: 'Updated Test Example Title For PromoMessage'
    }
  end
  let!(:promo_message) { create :promo_message }
  let!(:promo_messages) { create_list :promo_message, 3 }

  context 'GET /promo_messages' do
    # before do
      # 3.times { create :promo_message }
    # end
    it 'GET list of promo_messages' do
      get(promo_messages_path)
      expect(response.status).to eq 200
      promo_messages = JSON.parse response.body
      expect(promo_messages.count).to eq PromoMessage.count
      expect(promo_messages).to eq PromoMessage.all.as_json
    end
  end

  context 'POST /promo_messages' do
    it 'Create promo_message' do
      expect do
        post(
          promo_messages_path,
          params: promo_message_attrs
        )
      end.to change { PromoMessage.count }.by(1)
      expect(response.status).to eq 200

      promo_message = JSON.parse response.body
      expect(promo_message['title']).to eq promo_message_attrs[:title]
      expect(promo_message['body']).to eq promo_message_attrs[:body]
    end
  end

  context 'PUT /promo_messages/:id' do
    it 'Update promo_message' do
      put(
        "/promo_messages/#{promo_message.id}",
         params: promo_message_update_attrs
         )
      expect(response.status).to eq 200
      promo_message = JSON.parse response.body
      expect(promo_message['title']).to eq promo_message_update_attrs[:title]
      expect(promo_message['body']).to eq promo_message_update_attrs[:body]
    end
  end

  context 'DELETE /promo_messages/:id' do
    it 'Delete promo_message' do
      expect do
        delete("/promo_messages/#{promo_message.id}")
      end.to change { PromoMessage.count }.by(-1)
      expect(response.status).to eq 200
    end
  end
end
