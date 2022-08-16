class Alien < ActiveRecord::Base
  has_many :visitations
  has_many :earthlings, through: :visitations

  def visit earthling
    Visitation.create!(date: Date.today, alien_id: self.id, earthling_id: earthling.id)
  end

  def total_light_years_traveled
    dist = self.light_years_to_home_planet
    (dist * self.visitations.count)*2
  end

  def self.most_frequent_visitor
    self.all.max_by {|alien| alien.visitations.length}
  end

  def self.average_light_years_to_home_planet
    light_years_arr = []
    self.all.each {|alien| light_years_arr << alien.light_years_to_home_planet}
    light_years_arr.sum/light_years_arr.length
  end

end
