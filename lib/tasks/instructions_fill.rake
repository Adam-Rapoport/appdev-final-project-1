task({ :instructions_fill => :environment }) do

a = BuildingInstruction.new
a.id = 1
a.building_type_name = "hut"
a.buildings_count = 0
a.clay_cost = 3
a.clay_drop_prob = 5
a.grain_cost = 3
a.grain_drop_prob = 5
a.points_value = 1
a.steel_cost = 1
a.steel_drop_prob = 2
a.image = "https://www.flaticon.com/svg/static/icons/svg/502/502526.svg"
a.save
  
b = BuildingInstruction.new
b.id = 2
b.building_type_name = "house"
b.buildings_count = 0
b.clay_cost = 4
b.clay_drop_prob = 6
b.grain_cost = 5
b.grain_drop_prob = 8
b.points_value = 2
b.steel_cost = 2
b.steel_drop_prob = 3
b.image = "https://cdn4.iconfinder.com/data/icons/pictype-free-vector-icons/16/home-512.png"
b.save

c = BuildingInstruction.new
c.id = 3
c.building_type_name = "manor"
c.buildings_count = 0
c.clay_cost = 7
c.clay_drop_prob = 11
c.grain_cost = 6
c.grain_drop_prob = 9
c.points_value = 4
c.steel_cost = 6
c.steel_drop_prob = 9
c.image = "https://image.flaticon.com/icons/png/512/89/89009.png"
c.save

d = BuildingInstruction.new
d.id = 4
d.building_type_name = "castle"
d.buildings_count = 0
d.clay_cost = 8
d.clay_drop_prob = 12
d.grain_cost = 9
d.grain_drop_prob = 14
d.points_value = 5
d.steel_cost = 10
d.steel_drop_prob = 15
d.image = "https://www.flaticon.com/svg/static/icons/svg/1/1010.svg"
d.save

end