# frozen_string_literal: true

# frozen_string_literal:

require 'csv'

module PromoCenter
  module Downloaders
    class CsvDowndloader < BaseDownloader
      attr_reader :class_const, :csv

      def initialize(objects:, object_ids:, class_name:, object_fields:, filename:)
        @objects = objects
        @object_ids = object_ids
        @object_fields = object_fields
        @class_const = class_name&.classify&.constantize || User
        # Проверку нужно добавить на наличие окончания в названии файла на .csv
        # По поводу Time.zone.today - на Хабре есть статья по поводу таймзон. Легче держать данные в UTC)
        @filename = "#{filename}.csv" || "promotion-#{class_const.name.downcase}-#{Time.current}.csv"
        # может как вариант лучше использовать UTC(просто предложение, понимаю что иногда нужны и таймзоны, взависиости от типов задач)
      end

      def save!
        save_csv
      end

      private

      def save_csv
        CSV.open(filename, 'a+', headers: true) do |csv_file|
          objects.each do |object|
            csv_file << object_fields.map do |field|
              object.public_send(field) if object.methods.include? field.to_sym
            end
          end
        end
      end

      def objects
        @objects ||= @object_ids&.map { |id| class_const.find_by(id: id) }&.compact
      end
    end
  end
end
