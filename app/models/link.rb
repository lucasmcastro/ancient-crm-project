class Link < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :person
  belongs_to :linkable, :polymorphic => true
  
  # Atributos acessíveis via 'mass-assignment'
  attr_accessible :creator_id, :person_id, :linkable, :linkable_id, :link_type, :complement
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :person_id
  validates_presence_of :linkable_id
  validates_presence_of :link_type
  validates_presence_of :complement
  
  # Verificar objetos relacionados
  validates_associated :creator
  validates_associated :person
  validates_associated :linkable
  
  # Definições
  def to_s
    "#{self.link.type}: #{self.person} => #{self.complement} => #{self.linkable}"
  end
  
  def linktype_choices
    [['Cargo','Employment'],
    ['Parentesco','Kinship'],
    ['Relacionado','Related']] 
  end
end
