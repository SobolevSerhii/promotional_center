# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Clearance::Controller

  private

  def date_to
    Date.parse(params[:date_to]) if params[:date_to]
  end

  def date_from
    Date.parse(params[:date_from]) if params[:date_from]
  end
end
