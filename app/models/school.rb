class School < ActiveRecord::Base
  
  has_many :open_doors, :dependent => :destroy
  has_and_belongs_to_many :sections
  
  has_many :photos, :as => :attachable, :dependent => :destroy
  
  belongs_to :user
  
  default_scope :order => ["name ASC"]
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  define_index do
    indexes :name
    indexes anotation
    indexes street
    indexes town
    indexes zip_code
    indexes email1
    indexes email2
    indexes www
    indexes phone
    indexes fax
  end
  
end
