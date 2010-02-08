class Product < ActiveRecord::Base
  belongs_to :creator,
              :class_name => 'User',
              :foreign_key => 'creator_id'

  has_many :opportunities
  
  attr_accessible :name, :description, :creator
  
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :creator
  
  validates_associated :creator
  
  def to_s
    self.name
  end
  
end
