class Opportunity < ActiveRecord::Base
  # Comportamentos
  versioned
  include VersionedHelpers

  # Relacionamentos
  belongs_to :manager, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'
  belongs_to :account
  belongs_to :product
  belongs_to :opportunity_status
  
  has_many :interactions
  has_many :issues
  
  # Atributos acessíveis para "mass-assignment"
  attr_accessible :value, :manager_id, :product_id, :opportunity_status_id, :account
  
  # Atributos obrigatórios
  validates_presence_of :manager_id
  validates_presence_of :creator_id
  validates_presence_of :account_id
  validates_presence_of :product_id
  validates_presence_of :opportunity_status_id
  validates_presence_of :value

  # Verificar consistência dos objetos associados
  validates_associated :account
  validates_associated :manager
  validates_associated :creator
  validates_associated :product
  validates_associated :opportunity_status

  # Definições
  def important_attributes
    ["manager_id", "opportunity_status_id", "product_id", "value"]
  end
  
  def translated_attribute(attribute_name)
    case attribute_name
      when 'manager_id'
        'Gerente'
      when 'opportunity_status_id'
        'Status'
      when 'product_id'
        'Produto'
      when 'value'
        'Valor'
      else
        attribute_name
    end
  end
  
  def to_s
    self.product.to_s
  end
  
  def to_param
    "#{self.id}-#{self.product.to_s.gsub(/[^a-z0-9]+/i, '-')}-para-#{self.account.name.gsub(/[^a-z0-9]+/i, '-')}"
  end  
end
