class Alien < ActiveRecord::Base
  has_many :visitations
  has_many :earthlings, through: :visitations

  def visit(earthling)
    Visitation.create(date: Time.now, alien: self, earthling: earthling)
  end

  def total_light_years_traveled
    self.light_years_to_home_planet * self.visitations.count * 2
  end

  def self.most_frequent_visitor
    mapped_aliens =
      Alien.all.map do |alien|
        { id: alien.id, visits: alien.visitations.count }
      end

    max_id = mapped_aliens.max { |a, b| a[:visits] <=> b[:visits] }[:id]

    Alien.find(max_id)
    # binding.pry
  end

  def self.average_light_years_to_home_planet
    Alien.sum(:light_years_to_home_planet) / Alien.count
  end
end
