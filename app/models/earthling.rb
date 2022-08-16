class Earthling < ActiveRecord::Base
  has_many :visitations
  
  def full_name
    p "#{self.first_name} #{self.last_name}"
  end

  def self.filter_by_job arg_job
    p self.all.where(job: arg_job)
  end

end