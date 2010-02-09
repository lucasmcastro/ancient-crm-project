class Issue < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :status, :class_name => 'IssueStatus'
  belongs_to :opportunity

  has_many :notes, :as => :commentable

  # Atributos acessíveis para "mass-assignment"
  attr_accessible :status_id, :subject, :content
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :opportunity_id
  validates_presence_of :status_id
  validates_presence_of :subject
  validates_presence_of :content
  
  # Verificar consistência dos objetos associados   
  validates_associated :creator
  validates_associated :status
  validates_associated :opportunity

end
