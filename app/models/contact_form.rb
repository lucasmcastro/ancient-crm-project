class ContactForm < ActiveRecord::Base
  belongs_to :contactable, :polymorphic => true
  belongs_to :contact_type
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :contact, :contact_type_id, :contactable_id, :contact_type, :contactable
  
  # Atributos obrigatórios
  validates_presence_of :contact
  validates_presence_of :contact_type_id
  validates_presence_of :contactable_id
  
  # Verificar objetos relacionados
  validates_associated :contact_type
  validates_associated :contactable
  
  # Definições
  def to_s
    "#{self.contact_type}: #{self.contact}"
  end
  
end
