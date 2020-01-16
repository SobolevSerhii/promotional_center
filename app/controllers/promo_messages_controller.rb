class PromoMessagesController < ApplicationController
  attr_reader :provider

  def index
    promo_messages = PromoMessage.all
    render json: promo_messages, status: :ok
  end

  def create
    promo_message = PromoMessage.new(promo_message_params)
    if promo_message.save
      render json: promo_message, status: :ok
    else
      render json: promo_message.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    if promo_message.update(promo_message_params)
      render json: promo_message, status: :ok
    else
      render json: promo_message.errors.messages, status: :unprocessable_entity
    end
  end

  def destroy
    if promo_message.destroy
      render json: 'Destroy Success', status: :ok
    else
      render json: promo_message.errors.messages, status: :unprocessable_entity
    end
  end

  #   users = get_users
  #   recipients = []
  #   users.each do |user|
  #     recipients << user.phone
  #   end

  #   if @message.save && send_message(recipients)
  #     redirect_to promo_messages_path, notice: "Messages Sent Successfully!"
  #   end
  # end

  # def download_csv
  #   users = get_users
  #   send_data to_csv(users), filename: "promotion-users-#{Time.zone.today}.csv"
  # end

  private


  def promo_message
    @promo_message = PromoMessage.find(params[:id])
  end

  def promo_message_params
    params.permit(:title, :body)
  end

  # def to_csv(data)
  #   attributes = %w(id phone name)
  #   CSV.generate(headers: true) do |csv|
  #     csv << attributes
  #     data.each do |user|
  #       csv << attributes.map { |attr| user.send(attr) }
  #     end
  #   end
  # end

  # def send_message(recipients)
  #   recipients.each do |r|
  #     PromoMessagesSendJob.perform_later(r)
  #   end
  # end

  # def get_users
  #   @users = User.recent.joins(:ads).group("ads.user_id").where("`published_ads_count` = 1").
  #     where("published_at Between ? AND ?", Date.parse(params[:date_from]), Date.parse(params[:date_to])).page(params[:page])
  # end

end
