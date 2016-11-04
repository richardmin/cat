class TeamConfig < ActiveRecord::Base
  #attr_accessor :description, :num_support, :num_tank, :num_DPS

  validates_presence_of :description
  validates :num_support, :presence => true, :numericality => { :only_integer => true }
  validates :num_tank,    :presence => true, :numericality => { :only_integer => true }
  validates :num_DPS,     :presence => true, :numericality => { :only_integer => true }

end
