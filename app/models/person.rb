class Person < ActiveRecord::Base
  # Relacionamentos
  has_many :contact_forms, :as => :contactable
  has_many :links, :as => :linkable
  has_many :links
  has_many :facts, :as => :informable
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :surname, :forename

  # Definições
  def classe
    'Pessoa'
  end
  
  def to_s
    "#{self.forename} #{self.surname}"
  end
  
  def aditional_info
    if self.account_links.count.zero?
      ''
    else
      self.account_links[0]
    end
  end
  
  def account_links
    Link.person_account_links self.id
  end
  
  def direct_links
    Link.person_direct_links self.id
  end

  def reverse_links
    Link.person_reverse_links self.id
  end
end
