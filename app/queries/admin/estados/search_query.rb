class Admin::Estados::SearchQuery
  attr_reader :form, :model

  def initialize(form, model = Estado.all)
    @form = form
    @model = model
  end

  def call
    scope = model

    scope = by_nome(scope)
    scope = by_sigla(scope)
    scope = by_pais(scope)

    apply_order(scope)
  rescue
    model.none
  end

  private

  def apply_filters
    by_nome
    by_sigla
    by_pais
  end

  def by_nome(scope)
    return scope if form.nome.blank?

    scope.where("estados.nome ILIKE ?", "%#{form.nome}%")
  end

  def by_sigla(scope)
    return scope if form.sigla.blank?

    scope.where(sigla: form.sigla)
  end

  def by_pais(scope)
    return scope if form.pais_id.blank?

    scope.where(pais_id: form.pais_id)
  end

  def apply_order(scope)
    scope.order(:nome)
  end
end
