class Sale < ActiveRecord::Base

  validate :end_date_after_start_date?

  validates :name, presence: true
  validates :starts_on, presence: true
  validates :ends_on, presence: true
  validates :percent_off, presence: true

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

  def end_date_after_start_date?
    if ends_on < starts_on
      errors.add :end_date, "must be after start date"
    end
  end

end
