# Módulo com funções auxiliares associadas ao versionamento
# Deve ser utilizado em conjunto com Vestal Versions
# Para mais informações sobre Vestal Versions, acesse:
# http://github.com/laserlemon/vestal_versions
module VersionedHelpers
  module ClassMethods; end
  def self.included(base)
    base.extend ClassMethods
  end

  # Monta um dicionário contendo alterações consideradas importantes.
  # Para um atributo ser considerado importante, ele deve estar
  # listado no retorno da função important_attributes declarado
  # no model versionado em questão.
  # Nota: os atributos importantes deverão ser declarados como strings 
  # exemplo: issue.rb
  #   versioned
  #   def important_attributes
  #     ['name', 'content']
  #   end
  # 
  # Cada chave será o nome de um atributo que mudou e cada valor,
  # uma lista contendo os valores, respectivamente, antigo e novo
  # do atributo em questão.
  # exemplo:
  #   {
  #     'name' => ['antigo_nome', 'novo_nome"]
  #   }
  def important_changes(current_version)
    previous_version = current_version - 1
    changes = {}
    if current_version > 0
      previous_attributes = get_version_attributes(previous_version)
      current_attributes = get_version_attributes(current_version)
      
      previous_attributes.each do |attr,value|
        changes[attr] = [ value, current_attributes[attr] ] if is_important? attr and value != current_attributes[attr]   
      end      
    end
    changes
  end
  
  
  protected
  # Determina se o atributo em questão é considerado importante
  def is_important?(attribute_name)
    self.important_attributes.include? attribute_name
  end
  
  # Recupera os atributos do objeto em determinada versão
  def get_version_attributes(version)
    self.revert_to(version)
    self.attributes
  end
end