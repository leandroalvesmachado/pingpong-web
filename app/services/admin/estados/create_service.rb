class Admin::Estados::CreateService < ApplicationService
  def initialize(form)
    @form = form
  end

  def call
    return failure(@form.errors.full_messages) unless @form.valid?

    estado = nil

    ActiveRecord::Base.transaction do
      estado = Estado.create!(@form.to_attributes)
    end

    success(estado)
  rescue ActiveRecord::RecordInvalid => e
    failure(e.record.errors.full_messages)
  rescue StandardError => e
    failure("Erro inesperado ao criar estado")
  end
end
