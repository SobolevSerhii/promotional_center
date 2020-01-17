# frozen_string_literal: true

class PromoMessagesController < ApplicationController
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

  private

  def promo_message
    @promo_message = PromoMessage.find(params[:id])
  end

  def promo_message_params
    params.permit(:title, :body)
  end
end
