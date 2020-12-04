class PlayerAuthenticationController < ApplicationController
  # Uncomment this if you want to force players to sign in before any other actions
  skip_before_action(:force_player_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "player_authentication/sign_in.html.erb" })
  end

  def create_cookie
    player = Player.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if player != nil
      are_they_legit = player.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/player_sign_in", { :alert => "Incorrect password." })
      else
        session[:player_id] = player.id
      
        redirect_to("/", { :notice => "Welcome back!" })
      end
    else
      redirect_to("/player_sign_in", { :alert => "No player with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "player_authentication/sign_up.html.erb" })
  end

  def create
    @player = Player.new
    @player.email = params.fetch("query_email")
    @player.password = params.fetch("query_password")
    @player.password_confirmation = params.fetch("query_password_confirmation")
    @player.name = params.fetch("query_name")
    @player.kingdom = params.fetch("query_kingdom")
    @player.steel_amount = 10
    @player.clay_amount = 10
    @player.grain_amount = 10
    @player.points = 0
    @player.buildings_count = 0
    @player.sent_requests_count = 0
    @player.received_requests_count = 0

    save_status = @player.save

    if save_status == true
      session[:player_id] = @player.id
   
      redirect_to("/", { :notice => "Welcome to Diplomacy! To get you started, here are 10 units of each resource!"})
    else
      redirect_to("/player_sign_up", { :alert => "Player account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "player_authentication/edit_profile.html.erb" })
  end

  def update
    @player = @current_player
    @player.email = params.fetch("query_email")
    @player.password = params.fetch("query_password")
    @player.password_confirmation = params.fetch("query_password_confirmation")
    @player.name = params.fetch("query_name")
    @player.kingdom = params.fetch("query_kingdom")
    @player.steel_amount = params.fetch("query_steel_amount")
    @player.clay_amount = params.fetch("query_clay_amount")
    @player.grain_amount = params.fetch("query_grain_amount")
    @player.points = params.fetch("query_points")
    @player.buildings_count = params.fetch("query_buildings_count")
    @player.sent_requests_count = params.fetch("query_sent_requests_count")
    @player.received_requests_count = params.fetch("query_received_requests_count")
    
    if @player.valid?
      @player.save

      redirect_to("/", { :notice => "Player account updated successfully."})
    else
      render({ :template => "player_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_player.destroy
    reset_session
    
    redirect_to("/", { :notice => "Player account cancelled" })
  end
 
end
