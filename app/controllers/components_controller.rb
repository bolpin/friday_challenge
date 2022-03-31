class ComponentsController < ApplicationController
  def index
  end

  # def query_device_count
  #   @min_vers = params[:min_vers] || '0.0.0'
  #   @max_vers = params[:max_vers] || '9999.9999.9999'
  #   @os = params[:os] || 'android'
  #   @count = [
  #     {
  #       count: Device.with_os(@os).gr_eq_to_vers(parse_vers(@min_vers)).ls_eq_to_vers(parse_vers(@max_vers)).count,
  #       os: @os,
  #       min_vers: @min_vers.to_s,
  #       max_vers: @max_vers.to_s
  #     }
  #   ]
  # end
  #
  # def query_total_payout
  #   require 'pry';binding.pry
  #   @min_age = params[:min_age] || 1
  #   @max_age = params[:max_age] || 100
  #   require 'pry';binding.pry
  #   @payout = [
  #     {
  #       amount: OfferTarget.total_payout(@min_age, @max_age),
  #       min_age: @min_age.to_s,
  #       max_age: @max_age.to_s
  #     }
  #   ]
  # end
end
