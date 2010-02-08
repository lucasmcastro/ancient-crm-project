class IssueStatus < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  
  # Atributos acessíveis para "mass-assignment"
  attr_accessible :name, :creator

  # Atributos obrigatórios
  validates_presence_of :name
  validates_presence_of :creator_id
  
  # Verificar integridade dos objetos associados
  validates_associated :creator
end
