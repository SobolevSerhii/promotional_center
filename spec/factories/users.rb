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

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123123123' }
    phone { '+79052222222' }
  end
end
