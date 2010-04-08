class Link < ActiveRecord::Base
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :person
  belongs_to :linkable, :polymorphic => true
  
  # Atributos acessíveis via 'mass-assignment'
  attr_accessible :creator_id, :person_id, :linkable, :linkable_id, :link_type, :complement, :linkable_type
  
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
  
  # Filtros
  named_filter(:account_person_links) do |account_id|
    with(:linkable_id, account_id)
    with(:linkable_type, 'Account')
  end
  
  named_filter(:person_direct_links) do |person_id|
    with(:person_id, person_id)
    with(:linkable_type, 'Person')
  end

  named_filter(:person_reverse_links) do |person_id|
    with(:linkable_id, person_id)
    with(:linkable_type, 'Person')
  end

  named_filter(:person_account_links) do |person_id|
    with(:person_id, person_id)
    with(:linkable_type, 'Account')
  end

  # Definições
  def to_s
    "#{self.person} => #{self.complement} => #{self.linkable}"
  end
  
  def linktype_choices_for_person
    [['Parentesco','Kinship'],
    ['Relacionado','Related']] 
  end
  
  def linktype_choices_for_account
    [['Cargo','Employment'],
    ['Relacionado','Related']] 
  end
  
  def friendly_link_type
    return "Parentesco" if self.link_type == 'Kinship'
    return "Relacionado" if self.link_type == 'Related'
    return "Cargo" if self.link_type == 'Employment'
  end
end
