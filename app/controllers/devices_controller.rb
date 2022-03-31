require 'utils'

class DevicesController < ApplicationController
  include Utils

  def count
  end

  def show_count
    @min_vers = device_query_params[:min_vers]
    @max_vers = device_query_params[:max_vers]
    @operating_system_id = device_query_params[:operating_system_id]

    @count = [
      {
        count: Device.with_os(@operating_system_id).gr_eq_to_vers(parse_vers(@min_vers)).ls_eq_to_vers(parse_vers(@max_vers)).count,
        operating_system_id: @operating_system_id.to_s,
        min_vers: @min_vers.to_s,
        max_vers: @max_vers.to_s
      }
    ]
  end

  private

    def device_query_params
      params.require(:device).permit(:min_vers, :max_vers, :operating_system_id)
    end
end


