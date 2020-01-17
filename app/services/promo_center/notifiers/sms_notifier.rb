# frozen_string_literal: true

module PromoCenter
  module Notifiers
    class SmsNotifier < BaseNotifier
      def initialize(objects, promo_message_id)
        @objects = objects
        @promo_message = PromoMessage.find(promo_message_id)
        @class_const = class_name&.classify&.constantize || User
      end

      def sending!
        @objects.each do |object|
          PromoMessageRecipient.create!(recipient: object, promo_message: @promo_message)
          PromoMessageRecipientsSendJob.perform_later(
            object_id: object.id,
            promo_message_id: promo_message.id
          )
        end
      end
    end
  end
end
