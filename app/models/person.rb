class Person < ActiveRecord::Base
  # Relacionamentos
  has_many :contact_forms, :as => :contactable

  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :surname, :forename
    

  # Definições
  def to_s
    "#{self.forename} #{self.surname}"
  end
end
