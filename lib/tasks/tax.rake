task({ :collect_tax => :environment }) do

players = Player.all

  players.each do |a_player|
    
    a_player.buildings.each do |player_building|
      
      steel_drop = player_building.building_type.steel_drop_prob
      add_steel = rand(steel_drop)
      new_steel = a_player.steel_amount + add_steel
      a_player.update_attribute(:steel_amount, new_steel)

      grain_drop = player_building.building_type.grain_drop_prob
      add_grain = rand(grain_drop)
      new_grain = a_player.grain_amount + add_grain
      a_player.update_attribute(:grain_amount, new_grain)

      clay_drop = player_building.building_type.clay_drop_prob
      add_clay = rand(clay_drop)
      new_clay = a_player.clay_amount + add_clay
      a_player.update_attribute(:clay_amount, new_clay)


    end 

  end

end