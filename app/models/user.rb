# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  confirmation_token :string(128)
#  email              :string           not null
#  encrypted_password :string(128)      not null
#  phone              :string
#  remember_token     :string(128)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  device_id          :string
#
# Indexes
#
#  index_users_on_device_id       (device_id) WHERE (device_id IS NOT NULL)
#  index_users_on_email           (email) UNIQUE
#  index_users_on_phone           (phone) WHERE (phone IS NOT NULL)
#  index_users_on_remember_token  (remember_token)
#

class User < ApplicationRecord
  include Clearance::User

  has_many :ads, class_name: :Ad, foreign_key: :publisher_id, dependent: :destroy
  has_many :published_ads, -> { published }, class_name: :Ad, foreign_key: :publisher_id
  has_many :detach_ads, -> { detach }, class_name: :Ad, foreign_key: :publisher_id
  has_many :promo_message_recipients, foreign_key: :recipient_id, dependent: :destroy
  has_many :promo_messages, through: :promo_message_recipients
end
