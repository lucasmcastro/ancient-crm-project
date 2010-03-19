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
      if is_important? attr and value != current_attributes[attr]
        attr_display = self.translated_attribute(attr)
        attr_values = humanized_values(attr, value, current_attributes[attr])
        changes[attr_display] = attr_values
      end      
    end
    changes
  end
end 
  
  protected
  # Busca por atributos de id, quando o atributo ao invés de
  # representar uma característica do modelo, na verdade 
  # representa o id de objetos relacionado ao modelo.
  #
  # Se esse método for utilizado com um atributo normal,
  # irá retornar os valores originais "old_value", "new_value" 
  # sem alterações.
  # 
  # Rastreando exemplo com atributo de id:
  # humanized_values('opportunity_status_id', 1, 2)
  #   => related_object = #<MatchData "opportunity_status_id" 1:"opportunity_status">
  #   => klass = OportunityStatus
  #   => return [OportunityStatus.find(1).to_s, OportunityStatus.find(2).to_s]
  # 
  # Rastreando exemplo com atributo normal:
  # humanized_values('value', 0.0, 23000.0)
  #   => related_object = nil
  #   => return [0.0, 23000.0]  
  def humanized_values(original_attribute, old_value, new_value)
    id_regexp = /(.*)_id$/
    # Busque um atributo do tipo teste_id
    related_object = original_attribute.match(id_regexp)
    
    if related_object
      # Consiga uma referência da classe Teste
      klass = (self.send related_object[1]).class
      return [klass.find(old_value).to_s, klass.find(new_value).to_s]
    else
      return [old_value, new_value]
    end
  end
  
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