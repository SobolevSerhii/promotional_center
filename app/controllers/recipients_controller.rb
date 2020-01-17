# frozen_string_literal: true

class RecipientsController < ApplicationController
  attr_reader :provider

  def index
    render json: recipients_for_promo, status: :ok
  end

  def download_csv
    # Можно сделать через дополнительный класс Config для полей чтобы был настраиваемым
    object_fields = %w[id email phone]
    PromoCenter::Downloaders::Csv.new(
      objects: recipients_for_promo,
      object_fields: object_fields
    ).save!
    render json: 'File saved success', status: :ok
  end

  def send_promo_to_recipients
    # @param [provider] :sms, :push, :email
    @provider = params[:provider]
    raise 'Provider is required' unless provider

    provider_class_name = "#{PromoCenter::Notifiers}::#{provider.to_s}"
    provider_class_name.constantize.new(
      objects: recipients_for_promo,
      promo_message_id: params[:promo_message_id]
    ).sending!
    render json: 'Promo message sending success with' + provider.to_s, status: :ok
  end

  private

  def recipients_for_promo
    # Можно вынести в отдельный класс в сервисе PromoCenter::Filters::UserFilter.for_first_ad
    @recipients_for_promo = User.joins(:published_ads)
                                .group('users.id').having(count: 1)
                                .where(
                                  published_ads: {
                                    created_at: [date_from..date_to]
                                  }
                                )
  end
end
