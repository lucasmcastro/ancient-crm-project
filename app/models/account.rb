class Account < ActiveRecord::Base
  belongs_to :manager,
              :class_name => 'User',
              :foreign_key => 'manager_id'
              
  belongs_to :creator,
              :class_name => 'User',
              :foreign_key => 'creator_id'

  has_many :opportunities
  
  attr_accessible :name, :manager_id
  
  validates_presence_of :name
  
  validates_presence_of :creator
  validates_presence_of :manager
  
  validates_associated :creator
  validates_associated :manager

end
