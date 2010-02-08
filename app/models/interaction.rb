class Interaction < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :type, :class_name => 'InteractionType'
  belongs_to :opportunity
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :type_id, :subject, :content
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :type_id
  validates_presence_of :subject
  validates_presence_of :content
  
  # Verificar integridade dos objetos associados
  validates_associated :opportunity
  validates_associated :creator
  validates_associated :type
  
end
