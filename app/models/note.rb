class Note < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :commentable, :polymorphic => true
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :subject, :content
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :commentable_id
  validates_presence_of :subject
  validates_presence_of :content
  
  # Verificar consistência dos objetos relacionados
  validates_associated :creator
  validates_associated :commentable
 
end
