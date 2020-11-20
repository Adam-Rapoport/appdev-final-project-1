class BuildingInstructionsController < ApplicationController
  def index
    matching_building_instructions = BuildingInstruction.all

    @list_of_building_instructions = matching_building_instructions.order({ :created_at => :desc })

    render({ :template => "building_instructions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_building_instructions = BuildingInstruction.where({ :id => the_id })

    @the_building_instruction = matching_building_instructions.at(0)

    render({ :template => "building_instructions/show.html.erb" })
  end

  def create
    the_building_instruction = BuildingInstruction.new
    the_building_instruction.building_type_name = params.fetch("query_building_type_name")
    the_building_instruction.points_value = params.fetch("query_points_value")
    the_building_instruction.steel_cost = params.fetch("query_steel_cost")
    the_building_instruction.clay_cost = params.fetch("query_clay_cost")
    the_building_instruction.grain_cost = params.fetch("query_grain_cost")
    the_building_instruction.steel_drop_prob = params.fetch("query_steel_drop_prob")
    the_building_instruction.clay_drop_prob = params.fetch("query_clay_drop_prob")
    the_building_instruction.grain_drop_prob = params.fetch("query_grain_drop_prob")
    the_building_instruction.buildings_count = params.fetch("query_buildings_count")

    if the_building_instruction.valid?
      the_building_instruction.save
      redirect_to("/building_instructions", { :notice => "Building instruction created successfully." })
    else
      redirect_to("/building_instructions", { :notice => "Building instruction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_building_instruction = BuildingInstruction.where({ :id => the_id }).at(0)

    the_building_instruction.building_type_name = params.fetch("query_building_type_name")
    the_building_instruction.points_value = params.fetch("query_points_value")
    the_building_instruction.steel_cost = params.fetch("query_steel_cost")
    the_building_instruction.clay_cost = params.fetch("query_clay_cost")
    the_building_instruction.grain_cost = params.fetch("query_grain_cost")
    the_building_instruction.steel_drop_prob = params.fetch("query_steel_drop_prob")
    the_building_instruction.clay_drop_prob = params.fetch("query_clay_drop_prob")
    the_building_instruction.grain_drop_prob = params.fetch("query_grain_drop_prob")
    the_building_instruction.buildings_count = params.fetch("query_buildings_count")

    if the_building_instruction.valid?
      the_building_instruction.save
      redirect_to("/building_instructions/#{the_building_instruction.id}", { :notice => "Building instruction updated successfully."} )
    else
      redirect_to("/building_instructions/#{the_building_instruction.id}", { :alert => "Building instruction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_building_instruction = BuildingInstruction.where({ :id => the_id }).at(0)

    the_building_instruction.destroy

    redirect_to("/building_instructions", { :notice => "Building instruction deleted successfully."} )
  end
end
