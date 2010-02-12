class Address < ActiveRecord::Base
  # Relacionamentos
  belongs_to :addressable, :polymorphic => true

  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :street_1, :street_2, :zip, :city_area, :city, :state, :country

  # Atributos obrigatórios
  validates_presence_of :country, :state, :city
  
  # Verificar consistência de objetos relacionados
  validates_associated :addressable
  
  # Definições
  def to_s
    "#{self.street_1}, CEP #{self.zip} #{self.city}, #{self.state} - #{self.country}"
  end
  
end
