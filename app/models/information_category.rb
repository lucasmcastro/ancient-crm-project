class InformationCategory < ActiveRecord::Base
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :name, :data_type, :category_type

  # Atributos obrigatórios
  validates_presence_of :name
  validates_presence_of :data_type
  validates_presence_of :category_type
  
  
  # Definições
  def categorytype_choices
    [['',''],
    ['Conta', 'Account']]
  end

  def datatype_choices
    [['',''],
    ['Texto', 'Texto'],
    ['Inteiro', 'Inteiro'],
    ['Flutuante', 'Flutuante']]
  end
  
end
