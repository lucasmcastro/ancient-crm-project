class Account < ActiveRecord::Base
  # Relacionamentos
  belongs_to :manager, :class_name => 'User'
  belongs_to :creator, :class_name => 'User'

  has_one :address, :as => :addressable
  has_many :facts, :as => :informable
  has_many :phones, :as => :callable
  has_many :opportunities
  
  # Atributos acessíveis para 'mass-assignment'
  attr_accessible :name, :manager_id, :legal_name, :cnpj
  
  # Atributos obrigatórios
  validates_presence_of :name
  validates_presence_of :creator
  validates_presence_of :manager
  validates_presence_of :legal_name
  validates_presence_of :cnpj
  
  # Verificar consistência de objetos relacionados
  validates_associated :creator
  validates_associated :manager

  # Filters  
  named_filter(:interactions) do |account_id|
    with(:id, account_id)
    having(:opportunities) do
      having(:interactions)
    end
  end  

  named_filter(:issues) do |account_id|
    with(:id, account_id)
    having(:opportunities) do
      having(:issues)
    end
  end

  named_filter(:open_issues) do |account_id|
    with(:id, account_id)
    having(:opportunities) do
      having(:issues) do
        having(:issue_status) do
          any_of do
            with(:name).in ['Novo', 'Atribuído', 'Reaberto'] 
          end
        end
      end
    end
  end

  # Definições
  def classe
    'Conta'
  end
  def interactions_sum
    (Account.interactions self.id).count
  end
    
  def issues_sum
    (Account.issues self.id).count
  end

  def open_issues_sum
    Account.open_issues(self.id).count
  end
  
  def links
    Link.account_links self.id
  end
  
  def to_s
    "#{self.name}"
  end
  
  def to_param
    "#{self.id}-#{self.name.gsub(/[^a-z0-9]+/i, '-')}"
  end


# Adicionar noção de última interação, me fez pensar melhor na minha modelagem
# e decidi que preciso pensar mais antes de adicionar essa noção.
# É provável que a modelagem e abordagem do sistema quanto as interações mude
# para que ele fique mais usável.
# Por hora, o código fica aqui como histórico do que foi feito, porém não
# será utilizado por enquanto.
#  def last_interaction
#    account_id = self.id
#    Note.filter do
#      with(:commentable_type, 'Interaction')
#      join(Interaction, :join_type => :inner) do
#        on(:commentable_id => :id)
#        having(:opportunity) do
#          having(:account) do
#            with(:id, account_id)
#          end
#        end
#      end
#      order(:created_at, :desc)
#      limit(1)
#    end
#  end
end
