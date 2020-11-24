class BuildingsController < ApplicationController
  def index
    @player = Player.where({ :id => session[:player_id] }).first
    matching_buildings = @player.buildings
    #matching_buildings = Building.where({ :builder_id => session[:player_id] })

    @list_of_buildings = matching_buildings.order({ :created_at => :desc })
    @building_types = BuildingInstruction.all.order({:id => :asc})
    render({ :template => "buildings/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_buildings = Building.where({ :id => the_id })

    @the_building = matching_buildings.at(0)

    render({ :template => "buildings/show.html.erb" })
  end

  def create
    the_building = Building.new
    the_building.building_type_id = params.fetch("query_building_type_id")
    the_building.builder_id = session[:player_id]

    if the_building.valid? # and have enough resources
      the_building.save # add building

      # update resources and points

      new_steel = the_building.builder.steel_amount - the_building.building_type.steel_cost
      the_building.builder.update_attribute(:steel_amount, new_steel)

      new_grain = the_building.builder.grain_amount - the_building.building_type.grain_cost
      the_building.builder.update_attribute(:grain_amount, new_grain)

      new_clay = the_building.builder.clay_amount - the_building.building_type.clay_cost
      the_building.builder.update_attribute(:clay_amount, new_clay)

      new_points = the_building.builder.points + the_building.building_type.points_value
      the_building.builder.update_attribute(:points, new_points)

      redirect_to("/buildings", { :notice => "A #{the_building.building_type.building_type_name} was built successfully!" })
    else
      redirect_to("/buildings", { :notice => "Faild to build a #{the_building.building_type.building_type_name}!" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_building = Building.where({ :id => the_id }).at(0)

    the_building.building_type_id = params.fetch("query_building_type_id")
    the_building.builder_id = params.fetch("query_builder_id")

    if the_building.valid?
      the_building.save
      redirect_to("/buildings/#{the_building.id}", { :notice => "Building updated successfully."} )
    else
      redirect_to("/buildings/#{the_building.id}", { :alert => "Building failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_building = Building.where({ :id => the_id }).at(0)

    the_building.destroy

    redirect_to("/buildings", { :notice => "Building deleted successfully."} )
  end
end
