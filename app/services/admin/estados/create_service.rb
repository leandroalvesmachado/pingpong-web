class Admin::Estados::CreateService < ApplicationService
  def initialize(form)
    @form = form
  end

  def call
    return failure(nil) unless @form.valid?

    estado = Estado.new(@form.to_attributes)

    if estado.save
      success(estado)
    else
      failure("Erro ao salvar estado")
    end
  rescue StandardError => e
    failure("Erro inesperado ao criar estado: #{e}")
  end
end
