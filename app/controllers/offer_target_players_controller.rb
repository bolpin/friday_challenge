class OfferTargetPlayersController < ApplicationController
  def index
    @offer_target = OfferTarget.find(params[:offer_target_id])
    # @min_player_age =
    # @max_player_age =
    # @devices = Device.where(




    # @players = Player.where(
    #   device: 
    #   birthdate: (
    #     @min_birthdate..@max_birthdate
    #   ).where (
    #     gender: @offer_target.gender
    #   )
    #     # .limit(20).order('id desc') #.unscope(:order)
  end
end


