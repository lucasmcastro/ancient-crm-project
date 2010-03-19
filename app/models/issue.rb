class Issue < ActiveRecord::Base
  # Comportamentos
  versioned
  include VersionedHelpers
  
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :responsible, :class_name => 'User'
  belongs_to :issue_status
  belongs_to :opportunity

  has_many :notes, :as => :commentable

  # Atributos acessíveis para "mass-assignment"
  attr_accessible :issue_status_id, :subject, :content, :responsible_id
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :opportunity_id
  validates_presence_of :issue_status_id
  validates_presence_of :subject
  validates_presence_of :content
  
  # Verificar consistência dos objetos associados   
  validates_associated :creator
  validates_associated :issue_status
  validates_associated :opportunity

  # Definições
  def important_attributes
    ["responsible_id", "issue_status_id"]
  end
  
  def translated_attribute(attribute_name)
    case attribute_name
      when 'responsible_id'
        'Responsável'
      when 'issue_status_id'
        'Status'
      when 'subject'
        'Título'
      when 'content'
        'Conteúdo'
      else
        attribute_name
    end
  end

end
