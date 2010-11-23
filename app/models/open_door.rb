class OpenDoor < ActiveRecord::Base
  
  belongs_to :school
  
  default_scope :conditions => ["date_from >= ?", Date.today.beginning_of_day], :order => 'date_from'
  
  named_scope :box_days, lambda { {:conditions =>["date_from >= ?", Date.today.beginning_of_day], :order => 'date_from', :limit => 5 }}
  named_scope :box_days1, :limit => 1, :order => 'RAND()'
  named_scope :box_days2, lambda { {:conditions =>["date_from >= ?", Date.today.beginning_of_day], :order => 'date_from, RAND()', :limit => 1 }}
    
  define_index do
    indexes description
  end
  
end
