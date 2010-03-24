# Criando formatação brasileira para ser utilizada na aplicação
#Time::DATE_FORMATS[:default] = '%d/%m/%Y'
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(:default => "%d/%m/%Y")
