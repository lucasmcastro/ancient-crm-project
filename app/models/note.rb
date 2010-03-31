class Note < ActiveRecord::Base
  # Comportamentos
  acts_as_markup :language => :markdown, :columns => [:content]

  # Relacionamentos
  belongs_to :creator, :class_name => 'User'
  belongs_to :commentable, :polymorphic => true
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :subject, :content
  
  # Atributos obrigatórios
  validates_presence_of :creator_id
  validates_presence_of :commentable_id
  
  # Verificar consistência dos objetos relacionados
  validates_associated :creator
  validates_associated :commentable

  # Definições
  def versionable
    if self.commentable.class.class_name == 'Issue'
      return self.commentable
    elsif self.commentable.class.class_name == 'Interaction'
      return self.commentable.opportunity
    else
      return nil
    end
  end
end
