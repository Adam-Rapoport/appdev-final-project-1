task({ :instructions_fill => :environment }) do

a = BuildingInstruction.new
a.id = 1
a.building_type_name = "hut"
a.buildings_count = 0
a.clay_cost = 4
a.clay_drop_prob = 0.3
a.grain_cost = 2
a.grain_drop_prob = 0.5
a.points_value = 1 
a.steel_cost = 1
a.steel_drop_prob = 0.2
a.image = "https://www.flaticon.com/svg/static/icons/svg/502/502526.svg"
a.save
  
b = BuildingInstruction.new
b.id = 2
b.building_type_name = "house"
b.buildings_count = 0
b.clay_cost = 4
b.clay_drop_prob = 0.3
b.grain_cost = 2
b.grain_drop_prob = 0.5
b.points_value = 1 
b.steel_cost = 1
b.steel_drop_prob = 0.2
b.image = "https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/home-512.png"
b.save

c = BuildingInstruction.new
c.id = 3
c.building_type_name = "manor"
c.buildings_count = 0
c.clay_cost = 4
c.clay_drop_prob = 0.3
c.grain_cost = 2
c.grain_drop_prob = 0.5
c.points_value = 1 
c.steel_cost = 1
c.steel_drop_prob = 0.2
c.image = "https://image.flaticon.com/icons/png/512/89/89009.png"
c.save

d = BuildingInstruction.new
d.id = 4
d.building_type_name = "castle"
d.buildings_count = 0
d.clay_cost = 4
d.clay_drop_prob = 0.3
d.grain_cost = 2
d.grain_drop_prob = 0.5
d.points_value = 1 
d.steel_cost = 1
d.steel_drop_prob = 0.2
d.image = "https://www.flaticon.com/svg/static/icons/svg/1/1010.svg"
d.save

end