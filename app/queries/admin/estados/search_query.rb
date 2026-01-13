class Admin::Estados::SearchQuery
  attr_reader :params

  def initialize(params = {}, model = Estado.all)
    @params = params
    @model = model
  end

  def call
    apply_filters
    apply_order
    @model
  rescue
    @model.none
  end

  private

  def apply_filters
    by_nome
    by_sigla
    by_pais
  end

  def by_nome
    return if params[:nome].blank?

    @model = @model.where("estados.nome ILIKE ?", "%#{params[:nome]}%")
  end

  def by_sigla
    return if params[:sigla].blank?

    @model = @model.where(sigla: params[:sigla])
  end

  def by_pais
    return if params[:pais_id].blank?

    @model = @model.where(pais_id: params[:pais_id])
  end

  def apply_order
    @model = @model.order(:nome)
  end
end
