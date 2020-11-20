class ApplicationController < ActionController::Base
  before_action(:load_current_player)
  
  # Uncomment this if you want to force players to sign in before any other actions
  before_action(:force_player_sign_in)
  
  def load_current_player
    the_id = session[:player_id]
    @current_player = Player.where({ :id => the_id }).first
  end
  
  def force_player_sign_in
    if @current_player == nil
      redirect_to("/player_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
