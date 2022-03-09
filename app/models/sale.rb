class Sale < ActiveRecord::Base

  def self.active
    now = Date.current
    where("ends_on >= ? and starts_on <= ?", now, now)
  end
  
  def finished?
    ends_on < Date.current
  end
  
  def upcoming?
    starts_on > Date.current
  end
  
  def active?
    !upcoming? && !finished?
  end

end
