class Opportunity < ActiveRecord::Base
  # Relacionamentos
  belongs_to :manager, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :account
  belongs_to :product
  belongs_to :opportunity_status
  
  has_many :interactions
  
  # Atributos acessíveis para "mass-assignment"
  attr_accessible :value, :manager_id, :product_id, :opportunity_status_id, :account
  
  # Atributos obrigatórios
  validates_presence_of :manager_id
  validates_presence_of :creator_id
  validates_presence_of :account_id
  validates_presence_of :product_id
  validates_presence_of :opportunity_status_id
  validates_presence_of :value

  # Verificar consistência dos objetos associados
  validates_associated :account
  validates_associated :manager
  validates_associated :creator
  validates_associated :product
  validates_associated :opportunity_status
  
  
end
