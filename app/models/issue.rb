class Issue < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :status, :class_name => 'IssueStatus'
  belongs_to :opportunity

  # Atributos acessíveis para "mass-assignment"
  attr_accessible :creator_id, :opportunity_id, :status_id, :title, :subject
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :opportunity_id
  validates_presence_of :status_id
  validates_presence_of :tittle
  validates_presence_of :content
  
  # Verificar consistência dos objetos associados   
  validates_associated :creator
  validates_associated :status
  validates_associated :opportunity

end
