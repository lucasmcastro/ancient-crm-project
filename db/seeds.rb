# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create! :login => 'Nenhum', :password => 'nullnull', :password_confirmation => 'nullnull', :email => 'null@crm.com.br'
admin = User.create! :login => 'admin', :password => 'crmadmin', :password_confirmation => 'crmadmin', :email => 'admin@crm.com.br'

OpportunityStatus.create! :creator => admin, :name => 'Definição', :order => 1
OpportunityStatus.create! :creator => admin, :name => 'Avaliação', :order => 2 
OpportunityStatus.create! :creator => admin, :name => 'Proposição', :order => 3 
OpportunityStatus.create! :creator => admin, :name => 'Decisão', :order => 4 
OpportunityStatus.create! :creator => admin, :name => 'Fechado/Perda', :order => 5
OpportunityStatus.create! :creator => admin, :name => 'Fechado/Ganho', :order => 6

IssueStatus.create! :creator => admin, :name => 'Novo'
IssueStatus.create! :creator => admin, :name => 'Atribuído'
IssueStatus.create! :creator => admin, :name => 'Inválido'
IssueStatus.create! :creator => admin, :name => 'Duplicado'
IssueStatus.create! :creator => admin, :name => 'Resolvido'
IssueStatus.create! :creator => admin, :name => 'Reaberto'

Product.create! :creator => admin, :name => 'Indefinido', :description => 'O produto ainda não foi definido'
Product.create! :creator => admin, :name => 'Nimbus SMB', :description => 'Versão básica doNimbus para pequenas empresas'
Product.create! :creator => admin, :name => 'Nimbus Expert', :description => 'Versão avançada do Nimbus para empresas de porte médio'

InteractionType.create! :creator => admin, :name => 'Ligação Telefônica'
InteractionType.create! :creator => admin, :name => 'Conferência Telefônica'
InteractionType.create! :creator => admin, :name => 'Vídeo Conferência'
InteractionType.create! :creator => admin, :name => 'SMS'
InteractionType.create! :creator => admin, :name => 'Instant Messenger'
InteractionType.create! :creator => admin, :name => 'E-mail'
InteractionType.create! :creator => admin, :name => 'Visita'
InteractionType.create! :creator => admin, :name => 'Reunião'

InformationCategory.create! :category_type => 'Account', :name => 'Faturamento', :data_type => 'Flutuante'
InformationCategory.create! :category_type => 'Account', :name => 'Número Funcionários', :data_type => 'Inteiro'
InformationCategory.create! :category_type => 'Account', :name => 'Número de Máquinas', :data_type => 'Inteiro'

ContactType.create! :category => 'Virtual', :name => 'Site'
ContactType.create! :category => 'Virtual', :name => 'Email'
ContactType.create! :category => 'Fone', :name => 'Fixo Corporativo'
ContactType.create! :category => 'Fone', :name => 'Fixo Pessoal'
ContactType.create! :category => 'Fone', :name => 'Celular Corporativo'
ContactType.create! :category => 'Fone', :name => 'Celular Pessoal'
ContactType.create! :category => 'Fone', :name => 'Fax'
ContactType.create! :category => 'Fone', :name => 'Skype-in'
ContactType.create! :category => 'IM', :name => 'Skype'
ContactType.create! :category => 'IM', :name => 'MSN'
ContactType.create! :category => 'IM', :name => 'Jabber'
ContactType.create! :category => 'IM', :name => 'Gtalk'
ContactType.create! :category => 'Social', :name => 'Plaxo'
ContactType.create! :category => 'Social', :name => 'Rec6'
ContactType.create! :category => 'Social', :name => 'Twitter'
ContactType.create! :category => 'Social', :name => 'Blog'
ContactType.create! :category => 'Social', :name => 'Facebook'
ContactType.create! :category => 'Social', :name => 'Orkut'