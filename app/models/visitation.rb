class Visitation < ActiveRecord::Base
  belongs_to :alien
  belongs_to :earthling
  
  def visitations
    self.visitations
  end

end
