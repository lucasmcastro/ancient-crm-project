class Person < ActiveRecord::Base
  # Relacionamentos
  has_many :contact_forms, :as => :contactable
  has_many :links, :as => :linkable
  has_many :direct_links, :class_name => 'Link'

  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :surname, :forename


  # Definições
  def to_s
    "#{self.forename} #{self.surname}"
  end
  
  def reverse_links
    Link.person_links self.id
  end
end
