class Interaction < ActiveRecord::Base
  # Comportamentos
  acts_as_markup :language => :markdown, :columns => [:content]
  
  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :type, :class_name => 'InteractionType'
  belongs_to :opportunity

  has_many :notes, :as => :commentable, :order => 'created_at DESC'
  
  # Atributos acessíveis para 'mass-assignment'
  # Nota:
  # scheduled_date não está nessa lista pois deve ser manipulado
  # antes de enviado para o banco de dados, pois o banco de dados
  # só aceita o formato americano
  attr_accessible :type_id, :subject, :content, :scheduled_time
  
  # Atributos obrigatórios
  validates_presence_of :scheduled_date
  validates_presence_of :creator_id
  validates_presence_of :type_id
  validates_presence_of :subject
  validates_presence_of :content
  
  # Verificar integridade dos objetos associados
  validates_associated :opportunity
  validates_associated :creator
  validates_associated :type
  
  # Verificar formato dos atributos
  date_regexp = /(0[1-9]|[12][0-9]|3[01])[-\/.](0?[1-9]|1[012])[-\/.](19|20)?[0-9]{2}/
  time_regexp = /(0[1-9]|1[0-9]|2[0-3]):(0[0-9]|[1-5][0-9])/
  validates_format_of :scheduled_date, :with => date_regexp, :message => "utiliza formato dd/mm/aaaa"
  validates_format_of :scheduled_time, :with => time_regexp, :message => "utiliza formado hh:mm", :unless => :scheduled_time_is_blank?

  # Definições
  def scheduled_time_is_blank?
    self.scheduled_time.blank?
  end
  
  def to_param
    "#{self.id}-#{self.subject.gsub(/[^a-z0-9]+/i, '-')}-em-#{self.opportunity.product.to_s.gsub(/[^a-z0-9]+/i, '-')}-para-#{self.opportunity.account.name.gsub(/[^a-z0-9]+/i, '-')}"
  end    
end
