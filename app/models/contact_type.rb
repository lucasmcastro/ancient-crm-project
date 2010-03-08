class ContactType < ActiveRecord::Base
  # Relacionamentos
  has_many :contact_forms
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :name, :category

  # Atributos obrigatórios
  validates_presence_of :name
  validates_presence_of :category

  # Definições
  def to_s
    "#{self.category}/#{self.name}"
  end

end
