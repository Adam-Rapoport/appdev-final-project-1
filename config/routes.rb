Rails.application.routes.draw do



  # Routes for the Transaction resource:

  # CREATE
  post("/insert_transaction", { :controller => "transactions", :action => "create" })
          
  # READ
  get("/transactions", { :controller => "transactions", :action => "index" })
  
  get("/transactions/:path_id", { :controller => "transactions", :action => "show" })
  
  # UPDATE
  
  post("/modify_transaction/:path_id", { :controller => "transactions", :action => "update" })
  
  # DELETE
  get("/delete_transaction/:path_id", { :controller => "transactions", :action => "destroy" })

  #------------------------------

  # Routes for the Building instruction resource:

  # CREATE
  post("/insert_building_instruction", { :controller => "building_instructions", :action => "create" })
          
  # READ
  get("/building_instructions", { :controller => "building_instructions", :action => "index" })
  
  get("/building_instructions/:path_id", { :controller => "building_instructions", :action => "show" })
  
  # UPDATE
  
  post("/modify_building_instruction/:path_id", { :controller => "building_instructions", :action => "update" })
  
  # DELETE
  get("/delete_building_instruction/:path_id", { :controller => "building_instructions", :action => "destroy" })

  #------------------------------

  # Routes for the Building resource:

  # CREATE
  post("/insert_building", { :controller => "buildings", :action => "create" })
          
  # READ

  get("/", { :controller => "buildings", :action => "index" })

  get("/buildings", { :controller => "buildings", :action => "index" })
  
  get("/buildings/:path_id", { :controller => "buildings", :action => "show" })
  
  # UPDATE
  
  post("/modify_building/:path_id", { :controller => "buildings", :action => "update" })
  
  # DELETE
  get("/delete_building/:path_id", { :controller => "buildings", :action => "destroy" })

  #------------------------------

  # Routes for the Player account:

  # SIGN UP FORM
  get("/player_sign_up", { :controller => "player_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_player", { :controller => "player_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_player_profile", { :controller => "player_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_player", { :controller => "player_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_player_account", { :controller => "player_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/player_sign_in", { :controller => "player_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/player_verify_credentials", { :controller => "player_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/player_sign_out", { :controller => "player_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
