class OpportunityStatus < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  has_many :opportunities
  
  # Atributos acessíveis para "mass-assignment"
  attr_accessible :name, :order, :creator
  
  # Atributos obrigatórios
  validates_presence_of :creator
  validates_presence_of :name
  validates_presence_of :order
  
  # Verificar integridade dos objetos associados
  validates_associated :creator
  
  # Definições 
  def to_s
    self.name
  end
  
end
