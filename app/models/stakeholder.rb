class Stakeholder < ActiveRecord::Base
  # Relacionamentos
  belongs_to :person
  belongs_to :interaction
  
  # Atributos obrigatórios
  validates_presence_of :person
  validates_presence_of :interaction
  
  # Verificar objetos associados
  validates_associated :person
  validates_associated :interaction
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :person_id, :person
  
  # Definições
  
  def to_s
    self.person.to_s
  end
  
end
