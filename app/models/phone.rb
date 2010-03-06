class Phone < ActiveRecord::Base
  include ActionView::Helpers::NumberHelper
  
  # Relacionamentos
  belongs_to :callable, :polymorphic => true
  
  # Atributos acessíveis através de 'mass-assignment'
  attr_accessible :number, :company, :phone_type

  # Atributos obrigatórios
  validates_presence_of :number
  
  # Verificar objetos relacionados
  validates_associated :callable
  
  # Definições
  def company_choices
    [['',''],
    ['Tim', 'Tim'],
    ['Claro', 'Claro'],
    ['Vivo', 'Vivo'],
    ['Oi','Oi'],]
  end

  def type_choices
    [['',''],
    ['Fax', 'Fax'],
    ['Fixo', 'Fixo'],
    ['Celular', 'Celular'],]
  end
  
  def to_s
    self.number
    number_to_phone(self.number, :area_code=> true, :delimiter => ' ', :country_code => '55')
  end
end
