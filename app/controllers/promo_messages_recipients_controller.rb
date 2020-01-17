# frozen_string_literal: true

class PromoMessageRecipientsController < ApplicationController
  def index
    # @note
    # Все проморассылки, которые были отправлены пользователям
    # T.e вывод всех пользователей, которые были отправлены проморассылки с фильтром за период времени
    # PromoMessageRecipient.filter_by(date_from, date_to)
    # date_from && date_to in ApplicationController private methods
    render json: PromoMessageRecipient.filter_by_time_period(date_from, date_to), status: :ok
  end
end
