class Admin::Estados::UpdateService < ApplicationService
  def initialize(form, estado)
    @form = form
    @estado = estado
  end

  def call
    return failure(nil) unless @form.valid?

    if @estado.update(@form.to_attributes)
      success(@estado)
    else
      failure("Erro ao atualizar estado")
    end
  rescue StandardError => e
    failure("Erro inesperado ao atualizar estado: #{e}")
  end
end
