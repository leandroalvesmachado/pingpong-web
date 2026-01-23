module SelectPaises
  extend ActiveSupport::Concern

  def select_paises
    @paises ||= begin
      paises = Pais.order(:nome).pluck(:nome, :id)
      paises.unshift([ "Escolha a opção", nil ])
      paises
    rescue
      [ [ "Erro ao carregar países", nil ] ]
    end
  end
end
